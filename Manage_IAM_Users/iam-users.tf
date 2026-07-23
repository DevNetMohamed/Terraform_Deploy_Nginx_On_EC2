resource "aws_iam_user" "users" {
  for_each = local.users

  name = each.value.name
  path = try(each.value.path, "/")
  tags = merge(var.tags, try(each.value.tags, {}))
}

resource "aws_iam_user_login_profile" "login_profile_users" {
  for_each = var.create_login_profile ? aws_iam_user.users : {}

  user                    = each.value.name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
  pgp_key                 = var.pgp_key

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}
