locals {
  common_tags = {
    Name       = "public_RTB"
    ManageBy   = "Terraform"
    project    = "Deploy_Nginx_On_EC2"
    CostCenter = "1234"
  }
}
resource "aws_route_table" "public_RTB" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = local.common_tags
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_RTB.id
}