terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region     = AWS_REGION
  access_key = AWS_ACCESS_KEY_ID 
  secret_key = AWS_SECRET_ACCESS_KEY
}