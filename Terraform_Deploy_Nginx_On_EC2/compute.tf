resource "aws_instance" "Nginx_Server" {
  # AMI for Nginx
  ami                         = "ami-0720aff18b7589fbd"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_type           = "gp3"
    volume_size           = 20
  }

  tags = merge(local.common_tags, {
    Name = "Web_server_Nginx"
  })

  lifecycle {
    create_before_destroy = true
  }

}


