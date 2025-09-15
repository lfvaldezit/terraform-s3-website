variable "zone_id" {
  description = "The zone identifier to target for the resource"
  type = string
}

variable "record_name" {
  description = "The name of the record"
  type = string
}

variable "record_type" {
  description = "The type of the record"
  type = string
  default = "CNAME"
}

variable "record_content" {
  description = "The content of the record"
  type = string
}

variable "record_ttl" {
  description = "Time to live of the record"
  type = string
  default = "3600"
}

variable "account_id" {
  type = string
}
