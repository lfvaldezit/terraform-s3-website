# ------------------
# S3 Bucket 
# ------------------

bucket_name    = "terraform-static-website"
website_folder = "static-website/"

# ------------------
# ACM
# ------------------

validation_method      = "DNS"
create_route53_records = false
api_token              = ""
zone_id                = ""
record_type            = "CNAME"
sites = { site-a = { subdomain = "site-a", path = "site-a" }
site-b = { subdomain = "site-b", path = "site-b" } }
