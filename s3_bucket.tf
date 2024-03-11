resource "aws_s3_bucket" "my_bucket" {
  bucket = vars.AWS_BUCKETNAME
  acl    = "private"  # Access control list for the bucket (private by default)
}
