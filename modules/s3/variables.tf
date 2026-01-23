variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
}

variable "common_tags" {
    description = "Tags to apply to all created AWS resources"
    type = map(string)
}

variable "website_folder" {
    description = "The folder of the website"
    type = string
}

variable "aws_profile" {
    description = "The AWS profile to use "
    type = string
    default = "default"
}