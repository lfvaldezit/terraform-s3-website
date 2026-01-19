variable "sites" {
  type = map(object({
    subdomain = string
    path = optional(string)
  }))
}

variable "s3_bucket_domain_name" {
    description = "value"
    type = string
}

variable "domain_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
  default = {}
}

variable "cfn_tags" {
  type = map(string)
  default = {}
}

variable "aws_acm_certificate_arn" {
  type = string
}

variable "code" {
  type = string
}
# variable "function_arn" {
#   type = string
# }
