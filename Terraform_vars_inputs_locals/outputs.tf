output "S3_bucket_name" {
  value       = aws_s3_bucket.prod_bucket.bucket
  sensitive   = true
  description = "The name of the S3 bucket "
}

output "sensitive_var" {
  sensitive = true
  value     = var.sensitive_value
}