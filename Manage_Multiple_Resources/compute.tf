resource "aws_instance" "Web_Server_map" {
  for_each      = local.ec2_instance
  ami           = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.main[each.value.subnet_name].id

  tags = {
    Name    = each.key
    project = var.project
  }

}