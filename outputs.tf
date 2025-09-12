output "website_domain" {
  value = module.s3.s3_website_domain
}

output "website_endpoint" {
  value = module.s3.s3_website_endpoint
}

# output "domain_name" {
#   value = module.cfn.domain_name
# }