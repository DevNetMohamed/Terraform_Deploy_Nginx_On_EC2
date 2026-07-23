
resource "aws_vpc" "main" {
  for_each = var.vpc_cidr
  cidr_block = each.value.cidr_block
  tags = {
    project = var.project
    Name    = var.project
  }

  
}


resource "aws_subnet" "main" {
  for_each = var.subnet_config
  vpc_id            = aws_vpc.main[each.value.vpc_name].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.AZ

  tags = {
    project = each.key
    Name    = "${var.project}-public-subnet-${each.key}"
  }
}