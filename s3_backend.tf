
resource "aws_s3_bucket" "backend_bucket" {
  bucket = var.AWS_BACKEND_BUCKET
}