resource "aws_route53domains_registered_domain" "dev-profile" {
  domain_name = "adrian-arizpe.com"

  name_server {
    name = "ns-195.awsdns-24.com"
  }

  tags = {
    Environment = "test"
  }
}