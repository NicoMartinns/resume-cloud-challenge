output "acm_certificate_static_website" {
  value = aws_acm_certificate.cert.arn
}

output "aws_acm_certificate_cert_domain_validation_options" {
  value = aws_acm_certificate.cert.domain_validation_options

}