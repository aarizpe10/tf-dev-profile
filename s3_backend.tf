
resource "aws_s3_bucket" "backend_bucket" {
  bucket = "tf_statefile_bucket"
  acl    = "private"
}