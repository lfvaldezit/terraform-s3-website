variable "aws_s3_bucket_id" {
  description = "The ID (name) of the S3 bucket serving as the CloudFront origin"
  type = string
}

variable "aws_s3_bucket_arn" {
  description = "The full ARN of the S3 bucket"
  type = string
}

variable "cloudfront_dist_arn" {
  description = "The ARN of the existing CloudFront distribution"
  type = string
}