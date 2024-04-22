# S3 bucket policy
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.angular-bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::405935039529:group/Admins" 
        }
        Action    = "s3:*"
        Resource  = "${aws_s3_bucket.angular-bucket.arn}/*"
      }
    ]
  })
}
