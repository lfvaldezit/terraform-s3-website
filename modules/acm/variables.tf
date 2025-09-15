variable "zone_name" {
  type = string
}

variable "acm_tags"{
    type = map(string)
}

variable "subject_alternative_names" {
  type = set(string)
}

variable "record_name_id" {
  type = set(string)
  default = ["A", "B"]
}
