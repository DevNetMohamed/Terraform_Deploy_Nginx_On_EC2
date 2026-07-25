locals {
  public_Subnet = {
    for key, config in var.subnet_config : key => config if config.public
  }

  private_Subnet = {
    for key, config in var.subnet_config : key => config if !config.public
  }
}

data "aws_availability_zone" "available" {
  state = "available"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }

}


resource "aws_subnet" "this" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block
  tags = {
    Name = each.key
  }

  lifecycle {
    precondition {
      condition     = contains(data.aws_availability_zone.available.name, each.value.az)
      error_message = <<-EOT
        The AZ ${each.value.az} provided for the subnet ${each.key} is invaild.
        The setup AWS Region "[${join(", ", data.aws_availability_zone.available.id)}]" supports the follwoing AZs:

        Subnet Key: ${each.key} 
        AWS Region: ${data.aws_availability_zone.available.id}
        Invaild AZ: ${each.value.az}
        List of Supported AZs: ${data.aws_availability_zone.available.name}
      EOT
    }
  }
}


resource "aws_internet_gateway" "this" {
  count  = length(keys(local.public_Subnet)) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public_rtb" {
  count = length(keys(local.public_Subnet)) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }
}


resource "aws_route_table_association" "public" {
  for_each       = local.public_Subnet
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.public_rtb[0].id
}
