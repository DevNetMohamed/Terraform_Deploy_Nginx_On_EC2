locals {
  double_map = { for key, value in var.numbers_map : key => value * 2 }
  even_map   = var.numbers_map
  users_map = {
    for user_info in var.users : user_info.username => user_info.role...
  }

  users_map2 = {
    for username, roles in local.users_map : username => {
      roles = roles
    }
  }

  usernames_from_map = [for username, roles in local.users_map : username]
}


output "usernames_from_map" {
  value = local.usernames_from_map
}

output "users_map2" {
  value = local.users_map2
}

output "user_to_output" {
  value = local.users_map2[var.user_to_output].roles
}
output "user_info" {
  value = local.users_map

}


output "even_map" {
  value = [
    for k in sort(keys(local.even_map)) : {
      key   = k
      value = local.even_map[k]
    }
  ]
}

output "double_map" {
  value = local.double_map
}