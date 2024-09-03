resource "aws_route53_zone" "angular" {
  name = "adrian-arizpetest.com"
}
resource "aws_route53_record" "angular" {
  zone_id = aws_route53_zone.angular.zone_id
  name    = "adrian-arizpetest.com"
  type    = "A"
  ttl     = 300
  records = ["www.adrian-arizpe.com"]
}