resource "aws_route53_zone" "example" {
  name = "adrian-arizpetest.com"
}
resource "aws_route53_record" "angular" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "adrian-arizpetest.com"
  type    = "A"
  ttl     = 300
  records = "adrian-arizpetest.com"
}