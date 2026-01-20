locals {
  profile    = "default"
  aws_region = "us-east-1"

  domain_name = "lfvaldez-it.link"

  common_tags = {
    Owner : "admin"
    Environment : "Test"
    ManagedBy : "Terraform"
    Project : "terraform-website"
  }

  sites = {
    site-a = {
      subdomain = "site-a"
      path      = "site-a"
    }


    site-b = {
      subdomain = "site-b"
      path      = "site-b"
    }
  }
}