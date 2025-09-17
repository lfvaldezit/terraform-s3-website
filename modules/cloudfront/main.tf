# 60-second delay
resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name = var.name-oac
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {
    depends_on = [ time_sleep.wait_60_seconds ]
    enabled = true
    
    origin {
      domain_name = var.domain_name
      origin_id = local.s3_origin_id
      origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    }

    default_root_object = "index.html"
    aliases = var.aliases

    default_cache_behavior {
      target_origin_id = local.s3_origin_id
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods = [ "GET","HEAD" ]
      cached_methods = [ "GET", "HEAD" ]
      compress = true
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

     tags = merge(var.common_tags, var.cfn_tags)

}