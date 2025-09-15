variable "domain_name" {
  type = string
}

variable "acm_tags"{
    type = map(string)
}

variable "common_tags" {
  type = map(string)
}

variable "subject_alternative_names" {
  type = set(string)
}