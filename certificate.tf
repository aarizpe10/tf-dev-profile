resource "aws_acm_certificate" "cert" {
  domain_name       = "adrian-arizpe.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}