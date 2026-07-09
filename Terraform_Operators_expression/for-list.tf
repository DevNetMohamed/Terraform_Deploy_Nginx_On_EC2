locals {
  double_number = [for num in var.numbers_list : num * 2]
  even_number   = [for num in var.numbers_list : num if num % 2 == 0]
  resulte       = [for num in local.double_number : num if num % 2 == 0]
  firstname     = [for person in var.Object_list : person.firstname]
  fullname      = [for name in var.Object_list : "${name.firstname} ${name.lastname}"]
}


output "doubles" {
  value = local.double_number
}

output "even" {
  value = local.even_number
}

output "resulte" {
  value = local.resulte
}


output "firstname" {
  value = local.firstname
}

output "fullname" {
  value = local.fullname
}