# output "zone_id" {
#   value = module.zones
# }

output "angular-bucketName" {
  value = aws_s3_bucket.angular-bucket.id
}