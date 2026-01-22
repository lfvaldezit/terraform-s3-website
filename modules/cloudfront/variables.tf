variable "sites" {
  description= "Map of sites to host. Key = identifier, subdomain = part before domain (e.g. 'site-a'), path = optional prefix in S3 bucket (e.g. 'site-a')."
  type = map(object({
    subdomain = string
    path = optional(string)
  }))
}

variable "s3_bucket_domain_name" {
    description = "Regional domain name of the S3 bucket"
    type = string
}

variable "domain_name" {
  description = "Base domain for all sites"
  type = string
}

variable "common_tags" {
  description = "Tags to apply to all created AWS resources"
  type = map(string)
  default = {}
}

variable "aws_acm_certificate_arn" {
  description = "ARN of ACM certificate that covers the domain and all subdomains"
  type = string
}

variable "code" {
  description = "The JavaScript source code for the CloudFront Function"
  type = string
}
