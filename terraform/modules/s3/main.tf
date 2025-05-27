
# Create an S3 bucket for a static website
resource "aws_s3_bucket" "s3_static_website_nicolas" {
  bucket        = var.bucket_name
  force_destroy = true
}

# Index document for the static website
resource "aws_s3_bucket_website_configuration" "s3_vstatic_website_config" {
  bucket = var.bucket_name

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Allow public access to the static website
resource "aws_s3_bucket_public_access_block" "s3_static_website_public_access_block" {
  bucket = var.bucket_name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Retiramos esse resource para evitar o upload de arquivos estáticos para o S3, pois o upload será feito via GitHub Actions
# Upload the static website files to the S3 bucket
#resource "aws_s3_object" "s3_static_website_upload_object" {
#  bucket   = var.bucket_name
#  for_each = fileset("${path.module}/../../../site", "**")
#  key      = each.value
#  source   = "${path.module}/../../../site/${each.value}"
#}

# Set the bucket policy to allow public access to the static website
resource "aws_s3_bucket_policy" "s3_static_website_policy" {
  bucket = var.bucket_name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.s3_static_website_nicolas.arn}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.cloudfront_distribution_s3_website_arn
          }
        }
      }
    ]
  })
}
