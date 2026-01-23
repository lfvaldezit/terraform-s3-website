# ------------------
# S3 Bucket 
# ------------------

module "s3" {
  source         = "./modules/s3"
  bucket_name    = "${var.bucket_name}${local.domain_name}"
  website_folder = var.website_folder
  aws_profile    = local.profile
  common_tags    = local.common_tags
}

# ------------------
# ACM
# ------------------

module "acm" {
  source                    = "terraform-aws-modules/acm/aws"
  version                   = "5.1.0"
  domain_name               = local.domain_name
  zone_id                   = var.zone_id
  validation_method         = var.validation_method
  subject_alternative_names = ["*.${local.domain_name}"]
  create_route53_records    = var.create_route53_records
  tags                      = local.common_tags
}

# ------------------
# CloudFront
# ------------------

module "cfn" {
  depends_on              = [module.acm, module.s3]
  source                  = "./modules/cloudfront"
  domain_name             = local.domain_name
  sites                   = var.sites
  s3_bucket_domain_name   = module.s3.s3_bucket_regional_domain_name
  aws_acm_certificate_arn = module.acm.acm_certificate_arn
  common_tags             = local.common_tags
  code                    = <<-EOT
  function handler(event) {
    var request = event.request;
    var host = request.headers['host'].value.toLowerCase();

    var prefix = '';

    if (host.startsWith('site-a.')) {
        prefix = '/site-a';
    } else if (host.startsWith('site-b.')) {
        prefix = '/site-b';
    } 

    if (request.uri === '/' || request.uri === '') {
        request.uri = prefix + '/index.html';
    } else if (!request.uri.includes('.')) {
        request.uri = prefix + request.uri + (request.uri.endsWith('/') ? '' : '/') + 'index.html';
    } else {
        request.uri = prefix + request.uri;
    }
    return request;
  }
  EOT
}

# ------------------
# S3 Bucket Policy 
# ------------------

module "iam" {
  source              = "./modules/iam"
  aws_s3_bucket_id    = module.s3.s3_bucket_id
  aws_s3_bucket_arn   = module.s3.s3_bucket_arn
  cloudfront_dist_arn = module.cfn.cfn_dist_arn
}

# ------------------ 
# CloudFlare Record
# ------------------

module "records" {
  source         = "./modules/cloudflare"
  zone_id        = var.zone_id
  record_name    = var.sites
  record_type    = var.record_type
  record_content = module.cfn.cfn_domain_name
}