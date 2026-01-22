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
  description = "The subdomain name of the records"
  type = map(object({
    subdomain = string
    path = optional(string)
  }))
}