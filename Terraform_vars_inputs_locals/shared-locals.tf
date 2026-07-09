locals {
  Project       = "Terraform_vars_inputs_locals"
  Project_owner = "Mohamed Adel"
  cost_center   = "1313"
  managedby     = "Terraform"
  ENV           = "prod"
}

locals {
  common_tags = {
    Project       = local.Project
    Project_owner = local.Project_owner
    Cost_center   = local.cost_center
    Managedby     = local.managedby
    Env           = local.ENV
    sensitive_tag = var.sensitive_value
  }
}