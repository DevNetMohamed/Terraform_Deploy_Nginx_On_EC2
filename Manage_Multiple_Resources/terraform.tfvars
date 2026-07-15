ec2_instance_config_map = {
  "ubuntu_1" = {
    ec2_instance_count = 1
    instance_type      = "t2.micro"
    ami                = "ubuntu"
  }

  "nginx_1" = {
    ec2_instance_count = 2
    instance_type      = "t2.micro"
    ami                = "nginx"
  }
  
  "nginx_2" = {
    ec2_instance_count = 2
    instance_type      = "t2.micro"
    ami                = "nginx"
  }
}