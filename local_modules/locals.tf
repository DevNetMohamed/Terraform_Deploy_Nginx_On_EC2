locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
    nginx  = data.aws_ami.nginx.id
  }
  instance_type = "t2.micro"
  name          = "loacl_modules"
}