#--------------- S3 Bucket --------------- #

bucket_name    = ""
website_folder = "static-website/"
s3_tags = {
  Default = ""
}

#--------------- CloudFront --------------- #

aliases = [""]
cfn_tags = {
  Default = ""
}

#--------------- ACM --------------- #

acm_tags = {
  Default : ""
}

#--------------- CloudFlare --------------- #

api_token   = ""
zone_id     = ""
record_name = ""

