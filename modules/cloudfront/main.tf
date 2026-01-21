locals {
  aliases = [for key, site in var.sites : "${site.subdomain}.${var.domain_name}"]
}

resource "aws_cloudfront_origin_access_control" "this" {
  name = "${var.domain_name}-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_function" "this" {
  name    = "${replace(var.domain_name, ".", "-")}-subdomain-routing"
  runtime = "cloudfront-js-2.0"
  publish = true
  code = var.code
}

resource "aws_cloudfront_distribution" "this" {
    enabled = true
    comment = "Multi-site distribution for ${var.domain_name}"
    aliases = local.aliases
    #default_root_object = "index.html"

    origin {
        domain_name = var.s3_bucket_domain_name
        origin_id = "${var.domain_name}-s3-sites"
        origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    }
    
    default_cache_behavior {
      viewer_protocol_policy = "https-only"
      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = "${var.domain_name}-s3-sites"
      compress = true
      function_association {
        event_type = "viewer-request"
        function_arn = aws_cloudfront_function.this.arn
      }
      forwarded_values {
        query_string = false
        cookies {
          forward = "none"
        }
      }
    }

    viewer_certificate {
        cloudfront_default_certificate = false
        acm_certificate_arn = var.aws_acm_certificate_arn
        ssl_support_method = "sni-only"
        minimum_protocol_version = "TLSv1.2_2021"
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }
     tags = merge(var.common_tags)
}