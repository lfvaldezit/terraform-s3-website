
# --------------- S3 Bucket --------------- #

module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.bucket_name
  website_folder = var.website_folder
  aws_profile    = local.profile
  common_tags    = local.common_tags
  s3_tags        = var.s3_tags
}

# --------------- ACM--------------- #

module "acm" {
  source                    = "terraform-aws-modules/acm/aws"
  version                   = "5.1.0"
  domain_name               = local.domain_name
  zone_id                   = var.zone_id
  validation_method         = var.validation_method
  subject_alternative_names = ["*.${local.domain_name}"]
  create_route53_records    = var.create_route53_records
  tags                      = [acm_tags, local.common_tags]
}

#--------------- CloudFront --------------- #

module "cfn" {
  source                  = "./modules/cloudfront"
  domain_name             = module.s3.s3_bucket_regional_domain_name
  s3_origin_id            = module.s3.s3_bucket_regional_domain_name
  name-oac                = "${module.s3.s3_bucket_name}-oac"
  common_tags             = local.common_tags
  cfn_tags                = var.cfn_tags
  aliases                 = ["www.${local.domain_name}", local.domain_name]
  aws_acm_certificate_arn = module.acm.acm_certificate_arn
  depends_on              = [module.acm]
}

#--------------- S3 Bucket Policy --------------- #

module "iam" {
  source              = "./modules/iam"
  aws_s3_bucket_id    = module.s3.s3_bucket_id
  aws_s3_bucket_arn   = module.s3.s3_bucket_arn
  cloudfront_dist_arn = module.cfn.cfn_dist_arn
}

#--------------- CloudFlare Record--------------- #

module "www" {
  source         = "./modules/cloudflare"
  zone_id        = var.zone_id
  record_name    = var.record_name
  record_content = module.cfn.cfn_domain_name
}