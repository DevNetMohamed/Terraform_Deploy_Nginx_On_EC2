variable "project" {
  type = string
}

variable "vpc_cidr" {
  type = map(object({
    cidr_block = string
  }))

}

variable "subnet_config" {
  type = map(object({
    vpc_name   = string
    cidr_block = string
    AZ         = string
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "At least one of The provided CIDR blocks is not valid"
  }
}

variable "ec2_instance_config_map" {
  type = map(object(
    {
      ec2_instance_count = number
      instance_type      = string
      ami                = string
      subnet_name        = string
    },
  ))


  validation {
    condition = alltrue([
      for i in values(var.ec2_instance_config_map) :
      contains(["t2.micro"], i.instance_type)
    ])

    error_message = "Only t2.micro is allowed."
  }

  validation {
    condition = alltrue([
      for i in values(var.ec2_instance_config_map) :
      contains(["ubuntu", "nginx"], i.ami)
    ])

    error_message = "AMI must be ubuntu or nginx."
  }


  validation {
    condition = alltrue([
      for instance_config in values(var.ec2_instance_config_map) :
      instance_config.subnet_config < length(aws_subnet.main)
    ])
    error_message = "Invaild Subent count"
  }
}
