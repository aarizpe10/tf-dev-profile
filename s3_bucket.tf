resource "aws_s3_bucket" "my_bucket" {
  bucket = var.AWS_BUCKETNAME
  acl    = "private"  # Access control list for the bucket 
}
