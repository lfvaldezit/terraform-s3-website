# output "website_domain" {
#   value = module.s3.s3_website_domain
# }

# output "website_endpoint" {
#   value = module.s3.s3_website_endpoint
# }

output "cfn_domain_name" {
  value = module.cfn.cfn_domain_name
}