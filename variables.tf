#--------------- S3 Bucket --------------- #

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string 
}

variable "s3_tags" {
  type        = map(string)
  description = "The tags of the S3 bucket"
}

variable "website_folder" {
  type        = string
  description = "The folder of the website"
}

#--------------- CloudFront --------------- #

variable "cfn_tags" {
  type        = map(string)
  description = "The tags of the CloudFront Distribution"
}

variable "acm_tags" {
  type = map(string)
}

variable "aliases" {
  type = set(string)  
}

#--------------- CloudFlare --------------- #

variable "api_token" {
  description = "Generated API Token to access services and resources "
  type = string
}

variable "zone_id" {
  type = string
}

variable "record_name" {
  type = string
}
