variable "aws_region" {
  type = string
  validation {
    condition     = contains(["us-east-1", "us-west-1"], var.aws_region)
    error_message = "Please provide a valid AWS region."
  }
}


variable "ec2_instance_type" {
  type        = string
  description = "The type of managed Ec2 instances"
  validation {
    condition     = startswith(var.ec2_instance_type, "t3")
    error_message = "Only Support t3 family"
  }
}

variable "ec2_volume_config" {
  type = object({
    Size = number
    type = string
  })
  description = "The Size and type of root block volume for Ec2 instances"

  default = {
    Size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "sensitive_value" {
  type      = string
  sensitive = true
}