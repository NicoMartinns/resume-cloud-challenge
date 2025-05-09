variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
  
}

variable "s3_origin_id" {
  type        = string
  description = "The ID of the S3 origin"
  
}

variable "domain_website" {
  type        = string
  description = "The domain name for the website"   
  
}

variable "www_domain_website" {
    type        = string
    description = "The www domain name for the website"   
}