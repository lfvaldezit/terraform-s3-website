#--------------- S3 Bucket --------------- #

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "s3_tags" {
  type        = map(string)
  description = "The tags of the S3 bucket"
  default = {}
}

variable "website_folder" {
  type        = string
  description = "The folder of the website"
}

#--------------- ACM --------------- #

variable "validation_method" {
  type    = string
  default = "DNS"
}

variable "create_route53_records" {
  type    = bool
  default = false
}

variable "acm_tags" {
  type = map(string)
  default = {}
}

#--------------- CloudFront --------------- #

variable "cfn_tags" {
  type        = map(string)
  description = "The tags of the CloudFront Distribution"
  default = {}
}

variable "aliases" {
  type = set(string)
}

#--------------- CloudFlare --------------- #

variable "api_token" {
  description = "Generated API Token to access services and resources "
  type        = string
}

variable "zone_id" {
  type = string
}

variable "record_name" {
  type = string
}
