data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu
  instance_type = local.instance_type
  subnet_id     = module.vpc.private_Subnet["subnet-1"].subnet_id
  tags = {
    Name = local.name
  }
}