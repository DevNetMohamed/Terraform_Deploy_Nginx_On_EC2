output "instance_ids" {
  value = {
    for key, value in aws_instance.Web_Server_map :
    key => value.id
  }
}


output "subnet_ids" {

  value = {

    for key, value in aws_subnet.main :

    key => value.id

  }
}