terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
  backend "s3" {
    bucket       = "resume-nico-terraform-state"
    key          = "terraform/state"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

module "s3" {
  source = "./modules/s3"

  bucket_name                            = var.bucket_name
  cloudfront_distribution_s3_website_arn = module.cloudfront.cloudfront_distribution_s3_website_arn
}

module "route53" {
  source = "./modules/route53"

  domain_website                                     = var.domain_website
  www_domain_website                                 = var.www_domain_website
  cloudfront_distribution_s3_website_domain_name     = module.cloudfront.cloudfront_distribution_s3_website_domain_name
  cloudfront_distribution_s3_website_hosted_zone_id  = module.cloudfront.cloudfront_distribution_s3_website_hosted_zone_id
  aws_acm_certificate_cert_domain_validation_options = module.acm.aws_acm_certificate_cert_domain_validation_options
}

module "cloudfront" {
  source = "./modules/cloudfront"

  s3_origin_id                   = var.s3_origin_id
  domain_website                 = var.domain_website
  www_domain_website             = var.www_domain_website
  s3_bucket_domain_name          = module.s3.s3_bucket_regional_domain_name
  acm_certificate_static_website = module.acm.acm_certificate_static_website
}

module "acm" {
  source = "./modules/acm"

  domain_website     = var.domain_website
  www_domain_website = var.www_domain_website
}


resource "aws_acm_certificate_validation" "acm_validation" {
  certificate_arn         = module.acm.acm_certificate_static_website
  validation_record_fqdns = module.route53.validation_record_fqdns
}