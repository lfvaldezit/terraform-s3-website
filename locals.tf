locals {
  profile    = "default"
  aws_region = "us-east-1"

  common_tags = {
    Owner : "User"
    Environment : "Dev"
    ManagedBy : "Terraform"
  }

}