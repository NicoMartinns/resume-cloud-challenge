resource "aws_route53_record" "root_domain" {
  zone_id = aws_route53_zone.hosted_zone_id.zone_id
  name    = var.domain_website
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_s3_website_domain_name
    zone_id                = var.cloudfront_distribution_s3_website_hosted_zone_id
    evaluate_target_health = false
  }

}

resource "aws_route53_record" "www_domain" {
  zone_id = aws_route53_zone.hosted_zone_id.zone_id
  name    = var.www_domain_website
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_s3_website_domain_name
    zone_id                = var.cloudfront_distribution_s3_website_hosted_zone_id
    evaluate_target_health = false
  }

}

resource "aws_route53_zone" "hosted_zone_id" {
  name = var.domain_website
}

locals {
  dvo_map = { for dvo in var.aws_acm_certificate_cert_domain_validation_options : dvo.domain_name => dvo }
}

resource "aws_route53_record" "route53_validation" {
  for_each = toset(var.aws_acm_certificate_cert_domain)

  allow_overwrite = true
  name            = local.dvo_map[each.value].resource_record_name
  records         = [local.dvo_map[each.value].resource_record_value]
  type            = local.dvo_map[each.value].resource_record_type
  ttl             = 60
  zone_id         = aws_route53_zone.hosted_zone_id.zone_id

}