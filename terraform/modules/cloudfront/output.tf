output "cloudfront_distribution_s3_website_arn" {
  value = aws_cloudfront_distribution.cloudfront_distribution_s3_website.arn
}

output "cloudfront_distribution_s3_website_hosted_zone_id" {
  value = aws_cloudfront_distribution.cloudfront_distribution_s3_website.hosted_zone_id
}

output "cloudfront_distribution_s3_website_domain_name" {
  value = aws_cloudfront_distribution.cloudfront_distribution_s3_website.domain_name
  
}