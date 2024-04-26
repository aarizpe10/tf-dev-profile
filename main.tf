terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
data "aws_route53_zones" "all_zones" {}

data "aws_route53_zone" "angular" {
  for_each = toset([
    "Z015395639Y993ORQ7P96",
  ])
  zone_id = each.key
  }
