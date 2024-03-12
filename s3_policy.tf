# S3 bucket policy
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.angular-bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource  = "${aws_s3_bucket.angular-bucket.arn}/*"
      }
    ]
  })
}
