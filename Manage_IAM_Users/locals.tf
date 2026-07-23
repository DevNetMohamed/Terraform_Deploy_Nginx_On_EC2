locals {
  config = yamldecode(file("${path.module}/${var.user_roles_file}"))

  users = local.config.users
  roles = local.config.roles

  user_role_pairs = flatten([
    for user_key, user in local.users : [
      for role_key in user.roles : {
        key      = "${user_key}-${role_key}"
        user_key = user_key
        role_key = role_key
      }
    ]
  ])

  user_role_map = { for pair in local.user_role_pairs : pair.key => pair }

  user_policy_pairs = flatten([
    for user_key, user in local.users : [
      for arn in try(user.managed_policy_arns, []) : {
        key      = "${user_key}-${md5(arn)}"
        user_key = user_key
        arn      = arn
      }
    ]
  ])

  user_policy_map = { for pair in local.user_policy_pairs : pair.key => pair }


  role_policy_pairs = flatten([
    for role_key, role in local.roles : [
      for arn in try(role.managed_policy_arns, []) : {
        key      = "${role_key}-${md5(arn)}"
        role_key = role_key
        arn      = arn
      }
    ]
  ])

  role_policy_map = { for pair in local.role_policy_pairs : pair.key => pair }
}
