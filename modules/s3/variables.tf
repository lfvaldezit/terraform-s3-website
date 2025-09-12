variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
}

variable "s3_tags" {
    description = "The tag of the S3 bucket"
    type = map(string)
}

variable "common_tags" {
    description = "Common tags to apply to all resources"
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