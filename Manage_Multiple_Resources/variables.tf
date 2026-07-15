variable "subnet_count" {
  type    = number
  default = 2
}

variable "ec2_instance_config_map" {
  type = map(object(
    {
      ec2_instance_count = number
      instance_type      = string
      ami                = string

    },
  ))


  validation {
    condition = alltrue([
      for instance_config in var.ec2_instance_config_map : contains(["t2.micro"], instance_config.instance_type)
    ])
    error_message = "Only t2.micro instance are allowed"
  }

  validation {
    condition = alltrue([
      for instance_config in var.ec2_instance_config_map : contains(["ubuntu", "nginx"], instance_config.ami)
    ])
    error_message = "Only ubuntu and nginx ami instance are allowed"
  }
}
