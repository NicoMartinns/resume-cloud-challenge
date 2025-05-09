variable "domain_website" {
  type        = string
  description = "The domain name for the website"
}

variable "www_domain_website" {
  type        = string
  description = "The www domain name for the website"
}

variable "cloudfront_distribution_s3_website_domain_name" {
  type        = string
  description = "The domain name of the CloudFront distribution for the S3 website"
}

variable "cloudfront_distribution_s3_website_hosted_zone_id" {
  type        = string
  description = "The hosted zone ID of the CloudFront distribution for the S3 website"
}

variable "aws_acm_certificate_cert_domain_validation_options" {
  type = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_value = string
    resource_record_type  = string
  }))
  description = "The domain validation options for the ACM certificate"
}

variable "aws_acm_certificate_cert_domain" {
  type        = list(string)
  default     = ["martinsnicolas.com", "www.martinsnicolas.com"]
  description = "The domain name for the ACM certificate"

}