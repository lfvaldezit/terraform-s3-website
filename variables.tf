#--------------- S3 Bucket --------------- #

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "website_folder" {
  description = "The folder of the website"
  type        = string
}

#--------------- ACM --------------- #

variable "validation_method" {
  description = "The validation method for the ACM certificate"
  type        = string
}

variable "create_route53_records" {
  description = "Whether to create Route 53 records for the ACM certificate"
  type        = bool
}

#--------------- CloudFlare --------------- #

variable "api_token" {
  description = "Generated API Token to access services and resources "
  type        = string
}

variable "zone_id" {
  description = "The zone ID for the CloudFlare record"
  type        = string
}

variable "record_name_a" {
  description = "The name of the record A"
  type        = string
}

variable "record_name_b" {
  description = "The name of the record B"
  type        = string
}

variable "record_type" {
  description = "The type of the record"
  type        = string
}