resource "aws_s3_bucket" "angular-bucket" {
  bucket = var.AWS_BUCKETNAME
  tags = {
    Name        = "Angular Bucket Name"
    Environment = "Main"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_website_configuration" "angular-bucket" {
  bucket = aws_s3_bucket.angular-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
# S3 bucket ACL access

resource "aws_s3_bucket_ownership_controls" "angular-bucket" {
  bucket = aws_s3_bucket.angular-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "angular-bucket" {
  bucket                  = aws_s3_bucket.angular-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "angular-bucket-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.angular-bucket,
    aws_s3_bucket_public_access_block.angular-bucket,
  ]
  bucket = aws_s3_bucket.angular-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.angular-bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.angular-bucket.arn,
      "${aws_s3_bucket.angular-bucket.arn}/*",
    ]
  }
}