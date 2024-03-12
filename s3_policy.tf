# S3 bucket policy
resource "aws_s3_bucket_policy" "bucket-policy" {
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
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.angular-bucket.arn,
      "${aws_s3_bucket.angular-bucket.arn}/*",
    ]
  }
}
