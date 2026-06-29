resource "random_id" "bucket_suffix" {
  byte_length = 10
}
resource "aws_s3_bucket" "static_webSite" {
  bucket = "Terraform_static_Website_${random_id.bucket_suffix.hex}"

}


resource "aws_s3_bucket_public_access_block" "static_webSite" {
  bucket                  = aws_s3_bucket.static_webSite.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "static_webSite_public_read" {
  bucket = aws_s3_bucket.static_webSite.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "publicReadGetObject"
        Effect    = "Allow"
        principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_webSite.arn}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_website_configuration" "static_webSite" {
  bucket = aws_s3_bucket.static_webSite.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}



resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_webSite.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}


resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_webSite.id
  key          = "error.html"
  source       = "build/error.html"
  etag         = filemd5("build/error.html")
  content_type = "text/html"
}