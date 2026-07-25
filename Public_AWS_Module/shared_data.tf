locals {
  Project_name = "main_vpc"
  common_tags = {
    Project   = local.Project_name
    ManagedBy = "Terraform"
  }
}
