locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
    nginx  = data.aws_ami.nginx.id
  }
  ec2_instance = merge([
    for key, value in var.ec2_instance_config_map : {
      for i in range(value.ec2_instance_count) :
      "${key}-${i + 1}" => {
        ami           = value.ami
        instance_type = value.instance_type

      }
    }
    ]
  )
}