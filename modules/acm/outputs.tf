output "acm_certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "domain_validation_option" {
  value = aws_acm_certificate.this.domain_validation_options
}