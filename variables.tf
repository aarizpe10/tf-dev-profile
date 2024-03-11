variable "AWS_REGION" {
  description = "AWS region"
  type        = string
}

variable "AWS_BUCKETNAME" {
  description = "Name of the s3 Bucket"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive = true
}