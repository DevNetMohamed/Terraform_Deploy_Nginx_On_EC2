output "static_webSite_endpoint" {
  value = aws_s3_bucket_website_configuration.static_webSite.website_endpoint
}