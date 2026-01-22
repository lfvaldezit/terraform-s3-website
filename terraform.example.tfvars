# ------------------
# S3 Bucket 
# ------------------

bucket_name    = "example.com"
website_folder = "static-website/"

# ------------------
# ACM
# ------------------

validation_method      = "DNS"
create_route53_records = false
api_token              = ""
zone_id                = ""
record_name_a          = "site-a"
record_name_b          = "site-b"
record_type            = "CNAME"
