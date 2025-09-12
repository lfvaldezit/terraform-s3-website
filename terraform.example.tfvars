bucket_name    = "s3-website-demo"
website_folder = "../terraform-website/static-site/"

s3_tags = {
  BucketType : "StaticWebsite"
}

# cfn_tags = {
#   Name : "Static-website-cdn"
# }

