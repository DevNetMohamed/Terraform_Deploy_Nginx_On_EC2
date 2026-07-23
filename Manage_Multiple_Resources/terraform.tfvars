vpc_cidr = "10.0.0.0/16"
subnet_config = {
  default = {
    cidr_block = "10.0.0.0/24"
  }
  public-1 = {
    cidr_block = "10.0.1.0/24"
    AZ         = "us-east-1a"
  }
  public-2 = {

    cidr_block = "10.0.2.0/24"

    az = "us-east-1b"

  }
}

ec2_instance_config_map = {
  "ubuntu_1" = {
    ec2_instance_count = 1
    instance_type      = "t2.micro"
    ami                = "ubuntu"
    subnet_name        = "public-2"
  }

  "nginx_1" = {
    ec2_instance_count = 2
    instance_type      = "t2.micro"
    ami                = "nginx"
    subnet_name        = "public-1"
  }

  "nginx_2" = {
    ec2_instance_count = 2
    instance_type      = "t2.micro"
    ami                = "nginx"
    subnet_name        = "public-2"
  }
}