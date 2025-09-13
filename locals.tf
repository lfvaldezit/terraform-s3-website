locals {
  profile    = "default"
  aws_region = "us-east-1"

  common_tags = {
    Owner : "" # iamUser | example@example.com | TeamA 
    Environment : "" # Dev | Test | Prod 
    ManagedBy : "Terraform" 
  }

}