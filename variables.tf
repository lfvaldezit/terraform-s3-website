variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "s3_tags" {
  type        = map(string)
  description = "The tags of the S3 bucket"
}

# variable "cfn_tags" {
#   type = map(string)
#   description = "The tags of the CloudFront Distribution"
# }

variable "website_folder" {
  type        = string
  description = "The folder of the website"
}
