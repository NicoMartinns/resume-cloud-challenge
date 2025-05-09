resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain_website
  subject_alternative_names = [var.www_domain_website]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}