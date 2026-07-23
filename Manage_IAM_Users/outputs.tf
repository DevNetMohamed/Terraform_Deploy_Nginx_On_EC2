output "user_names" {
  description = "Names of created IAM users."
  value       = { for key, user in aws_iam_user.users : key => user.name }
}

output "user_arns" {
  description = "ARNs of created IAM users."
  value       = { for key, user in aws_iam_user.users : key => user.arn }
}

output "role_names" {
  description = "Names of created IAM roles."
  value       = { for key, role in aws_iam_role.roles : key => role.name }
}

output "role_arns" {
  description = "ARNs of created IAM roles."
  value       = { for key, role in aws_iam_role.roles : key => role.arn }
}

output "encrypted_passwords" {
  description = "Encrypted console passwords (only populated if pgp_keyey was set).Decrypt locally, e.g. `terraform output -raw encrypted_passwords | base64 -d | gpg -d`."
  value       = { for key, policy in aws_iam_user_login_profile.login_profile_users : key => policy.encrypted_password }
  sensitive   = true
}
