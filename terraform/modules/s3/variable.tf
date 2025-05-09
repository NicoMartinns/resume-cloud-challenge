variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
  
}

variable "cloudfront_distribution_s3_website_arn" {
  type        = string
  description = "The ARN of the CloudFront distribution for the S3 website"
  
}