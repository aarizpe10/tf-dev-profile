output "zone_id" {
  value = module.zones
}

output "website_url" {
  value = "http://${aws_s3_bucket.angular-bucket.bucket}.s3-website.${var.AWS_REGION}.amazonaws.com"
}
