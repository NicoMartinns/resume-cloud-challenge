
resource "aws_cloudfront_origin_access_control" "cloudfront_distribution_origin_access_control" {
  name                              = "OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cloudfront_distribution_s3_website" {
  origin {
    domain_name              = var.s3_bucket_domain_name # Domain name of the S3 bucket
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_distribution_origin_access_control.id
    origin_id                = var.s3_origin_id
  }

  enabled             = true # Enable the distribution
  is_ipv6_enabled     = true # Enable IPv6 that a proto
  comment             = "CloudFront distribution for S3 resume website"
  default_root_object = "index.html"

  aliases = [var.domain_website, var.www_domain_website] # CNAMEs for the distribution

  default_cache_behavior {
    target_origin_id       = var.s3_origin_id
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"] # HTTP methods that CloudFront accepts from viewers
    cached_methods         = ["GET", "HEAD"]                                              # HTTP methods that CloudFront caches responses from the origin
    viewer_protocol_policy = "redirect-to-https"                                          # How cloudfront should handle HTTP and HTTPS requests
    min_ttl                = 0                                                            # Minimum amount of time that you want objects to stay in the CloudFront cache
    default_ttl            = 3600                                                         # Default amount of time that you want objects to stay in the CloudFront cache
    max_ttl                = 86400                                                        # Maximum amount of time that you want objects to stay in the CloudFront cache
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

  }

  price_class = "PriceClass_200" # Wich region you want to use for the distribution. 200 = US, Canada and Europe. 100 = US only. All = all regions

  restrictions { # Restriction for the distribution
    geo_restriction {
      restriction_type = "none" # Which type of restriction you want to use. None = no restriction. Blacklist = block some countries. Whitelist = allow only some countries
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_static_website # ARN of the ACM certificate
    ssl_support_method       = "sni-only"                         # How CloudFront should handle SSL/TLS requests. SNI-only = use the ACM certificate. VIP = use the ACM certificate and a custom SSL certificate
    minimum_protocol_version = "TLSv1.2_2021"                     # Modern TLS version
  }
}