variable "numbers_list" {
  type = list(number)
}

variable "numbers_map" {
  type = map(number)
}

variable "Object_list" {
  type = list(object(
    {
      firstname = string
      lastname  = string
    }
  ))
}