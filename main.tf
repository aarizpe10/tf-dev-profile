terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region     = vars.AWS_REGION
  access_key = vars.AWS_ACCESS_KEY_ID 
  secret_key = vars.AWS_SECRET_ACCESS_KEY
}