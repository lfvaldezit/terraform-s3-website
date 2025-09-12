
# --------------- S3 Bucket --------------- #

module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.bucket_name
  website_folder = var.website_folder
  aws_profile    = local.profile
  common_tags    = local.common_tags
  s3_tags        = var.s3_tags
}

#--------------- CloudFront --------------- #

# module "cfn" {
#   source      = "./modules/cloudfront"
#   domain_name = module.s3.s3_bucket_regional_domain_name
#   name-oac    = "${module.s3.s3_bucket_name}-oac"
#   common_tags = local.common_tags
#   cfn_tags = var.cfn_tags

#}

#--------------- S3 Bucket Policy --------------- #

# module "iam" {
#   source              = "./modules/iam"
#   aws_s3_bucket_id    = module.s3.s3_bucket_id
#   aws_s3_bucket_arn   = module.s3.s3_bucket_arn
#   cloudfront_dist_arn = module.cfn.cfn_dist_arn
# }