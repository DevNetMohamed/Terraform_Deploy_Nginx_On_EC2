resource "aws_security_group" "public_http_traffic" {
  description = "Security group allowing traffic port 443 and 80"
  name        = "public_http_traffic"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "sgr"
  })

}


resource "aws_security_group_rule" "http" {
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.public_http_traffic.id
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}