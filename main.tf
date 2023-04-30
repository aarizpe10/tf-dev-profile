# Define the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a KMS key for encrypting S3 objects
resource "aws_kms_key" "s3_key" {
  description             = "KMS key for encrypting S3 objects"
  deletion_window_in_days = 30
}

# Create an S3 bucket and enable default encryption with the KMS key
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

# Create a Route 53 DNS record for the S3 bucket
resource "aws_route53_record" "my_bucket_record" {
  name    = "my-bucket.example.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_s3_bucket.my_bucket.bucket_regional_domain_name]

  zone_id = data.aws_route53_zone.example_com.id
}

# Get the Route 53 zone ID for example.com
data "aws_route53_zone" "example_com" {
  name = "example.com."
}
