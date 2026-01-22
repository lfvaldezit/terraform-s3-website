variable "zone_id" {
  description = "The zone identifier to target for the resource"
  type = string
}

variable "record_type" {
  description = "The type of the record"
  type = string
}

variable "record_content" {
  description = "The content of the record"
  type = string
}

variable "record_name" {
  description= "Map of sites to host. Key = identifier, subdomain = part before domain (e.g. 'site-a'), path = optional prefix in S3 bucket (e.g. 'site-a')."
  type = map(object({
    subdomain = string
    path = optional(string)
  }))
}