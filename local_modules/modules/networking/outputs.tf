locals {
  output_public_subnet = {
    for key in keys(local.public_Subnet) : key => {
      subnet_id         = aws_subnet.this[key].id
      availiablity_zone = aws_subnet.this[key].availability_zone
    }
  }

  output_private_Subnet = {
    for key in keys(local.private_Subnet) : key => {
      subnet_id         = aws_subnet.this[key].id
      availiablity_zone = aws_subnet.this[key].availability_zone
    }
  }
}


output "vpc_id" {
  description = "this AWS id from created VPC"
  value       = aws_vpc.this.id
}

output "public_Subnet" {
  value = local.output_public_subnet
}

output "private_Subnet" {
  value = local.output_private_Subnet
}
