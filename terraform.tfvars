# ------------------
# S3 Bucket 
# ------------------

bucket_name    = "terraform-multi-site-"
website_folder = "static-website/"

# ------------------
# ACM
# ------------------

validation_method      = "DNS"
create_route53_records = false
api_token              = "your_cloudflare_api_token"
zone_id                = "your_cloudflare_zone_id"
record_type            = "CNAME"
sites = { site-a = { subdomain = "site-a", path = "site-a" },
site-b = { subdomain = "site-b", path = "site-b" } }
