# output "website_domain" {
#   value = module.s3.s3_website_domain
# }

# output "website_endpoint" {
#   value = module.s3.s3_website_endpoint
# }

# output "cfn_domain_name" {
#   value = module.cfn.cfn_domain_name
# }

output "domain_validation_option" {
  description = "Set of domain validation objects which can be used to complete certificate validation"
  value = module.acm.domain_validation_option
}