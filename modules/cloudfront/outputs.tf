output "domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "cfn_dist_arn" {
  value = aws_cloudfront_distribution.this.arn
}
