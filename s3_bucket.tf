resource "aws_s3_bucket" "my_bucket" {
  bucket = var.AWS_BUCKETNAME
  tags = {
    Name        = "Angular Dev Bucket Name"
    Environment = "Main"
  }
}
