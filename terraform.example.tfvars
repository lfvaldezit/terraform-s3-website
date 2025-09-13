bucket_name    = "terraform-website"
website_folder = "static-website/"

s3_tags = {
  BucketType : "StaticWebsite"
}

cfn_tags = {
  Name : "Static-website-cfn"
}

