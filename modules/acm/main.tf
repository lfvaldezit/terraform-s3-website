resource "aws_route53_zone" "this" {
  name = var.zone_name
}

resource "aws_acm_certificate" "cert" {
  domain_name       = aws_route53_zone.this.name
  subject_alternative_names = var.subject_alternative_names
  validation_method = "DNS"
  tags = var.acm_tags
  lifecycle {
    create_before_destroy = true
  }
}
# resource "aws_route53_record" "cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name  = dvo.resource_record_name
#       type  = dvo.resource_record_type
#       value = dvo.resource_record_value
#     }
#   }

#   name    = each.value.name
#   type    = each.value.type
#   zone_id = aws_route53_zone.this.id
#   records = [each.value.value]
#   ttl     = 300
# }

# resource "aws_acm_certificate_validation" "cert_valid" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]

# }
