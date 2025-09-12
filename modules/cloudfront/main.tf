resource "aws_cloudfront_origin_access_control" "oac" {
  name = var.name-oac
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {

    enabled = true
    
    origin {
      domain_name = var.domain_name
      origin_id = local.s3_origin_id
      origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    }

    default_root_object = "index.html"

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
        cloudfront_default_certificate = true
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

     tags = merge(var.common_tags, var.cfn_tags)

}