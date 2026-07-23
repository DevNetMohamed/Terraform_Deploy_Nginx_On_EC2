aws_region              = "us-east-1"
user_roles_file         = "user-roles.yaml"
create_login_profile    = true
password_length         = 16
password_reset_required = true
# pgp_key = filebase64("./keys/team_pub.asc")

tags = {
  project     = "terraform-iam"
  managed_by  = "terraform"
  environment = "prod"
}
