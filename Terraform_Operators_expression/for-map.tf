locals {
  double_map = { for key, value in var.numbers_map : key => value * 2 }
  even_map   = var.numbers_map
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