//Domain certification retrieval
resource "tls_private_key" "keyAlgorithm" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "angularDev" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.keyAlgorithm.private_key_pem

  subject {
    common_name  = "adrianArizpe.com"
    organization = "ACME Examples, Inc"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "cert" {
  provider         = aws.region
  private_key      = tls_private_key.keyAlgorithm.private_key_pem
  certificate_body = tls_self_signed_cert.angularDev.cert_pem
}