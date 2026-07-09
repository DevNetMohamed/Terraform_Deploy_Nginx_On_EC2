resource "aws_s3_bucket" "prod_bucket" {
  bucket = "${local.Project}-${random_id.random_siffex.hex}"

  tags = merge(local.common_tags, var.additional_tags)
}