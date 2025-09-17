terraform {
  required_providers {
        cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

  }
}

resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = "DNS"
  tags = merge(var.acm_tags, var.common_tags)
  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = trim(split(".", dvo.resource_record_name)[0], ".")
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name= each.value.name
  content= each.value.record
  type= each.value.type
  zone_id= var.zone_id
  proxied = false
  allow_overwrite = true

}


  # zone_id = var.zone_id
  # name = var.record_name
  # type = var.record_type
  # content = var.record_content
  # proxied = false