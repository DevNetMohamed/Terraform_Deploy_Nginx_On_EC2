ec2_instance_type = "t3.micro"

ec2_volume_config = {
  Size = 10
  type = "gp2"
}

additional_tags = {
  valuesFrom = "terraform.tfvars"
  ENV        = "Prod"
}