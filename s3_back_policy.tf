# S3 bucket policy to allow all actions on the bucket
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.backend_bucket.id
  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : "arn:aws:s3:::${aws_s3_bucket.backend_bucket.id}/*"
      }
    ]
  })
}
