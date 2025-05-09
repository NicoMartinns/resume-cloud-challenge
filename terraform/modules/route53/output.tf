output "validation_record_fqdns" {
  value = [for record in aws_route53_record.route53_validation : record.fqdn]

}