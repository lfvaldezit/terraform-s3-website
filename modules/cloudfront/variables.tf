variable "domain_name" {
    description = "value"
    type = string
}

variable "name-oac" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "cfn_tags" {
  type = map(string)
}