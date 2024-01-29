resource "aws_s3_bucket" "hostBucket" {
  bucket = "www.adrian-arizpe.com"

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  website {
    index_document = "index.html" # Specify the index document for the website
    error_document = "error.html" # Specify the error document for the website
  }

  tags = {
    Name        = "Hosting Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "log.adrian-arizpe"  # Set a globally unique log bucket name

  acl    = "log-delivery-write"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}