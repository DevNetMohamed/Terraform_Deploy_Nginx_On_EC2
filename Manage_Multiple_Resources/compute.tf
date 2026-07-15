locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
    nginx  = data.aws_ami.nginx.id
  }
  ec2_instance = merge([
    for k, v in var.ec2_instance_config_map : {
      for i in range(v.ec2_instance_count) :
      "${k}-${i + 1}" => {
        ami           = v.ami
        instance_type = v.instance_type
      }
    }
    ]
  )
}

resource "aws_instance" "Web_Server_map" {
  for_each      = local.ec2_instance
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = var.subnet_count

  tags = {
    Name    = each.key
    project = local.project
  }

}