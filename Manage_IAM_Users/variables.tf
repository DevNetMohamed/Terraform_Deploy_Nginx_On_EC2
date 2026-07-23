variable "aws_region" {
  description = "AWS region to deploy IAM resources into."
  type        = string
  default     = "us-east-1"
}

variable "user_roles_file" {
  description = "Path to the YAML file defining users and roles."
  type        = string
  default     = "user-roles.yaml"
}

variable "create_login_profile" {
  description = "Whether to create a console login profile for each user."
  type        = bool
  default     = true
}

variable "password_length" {
  description = "Length of the auto-generated console password."
  type        = number
  default     = 12
}

variable "password_reset_required" {
  description = "Whether the user must reset their password on first login."
  type        = bool
  default     = true
}

variable "pgp_key" {
  description = "Optional base64-encoded PGP public key used to encrypt the generated password. Leave null to return it in plain text in state (not recommended for production)."
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags applied to all IAM resources."
  type        = map(string)
  default     = {}
}
