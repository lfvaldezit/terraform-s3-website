# Host Multiple Static Websites with Subdomains using S3 + CloudFront (OAC + Function)

## 🏗️ Architecture

### Target technology stack

* **AWS S3**: Stores static site files.
* **AWS CloudFront**: Global Content Delivery Network (CDN).
* **AWS CloudFront Function**: Routes each subdomain into its folder.
* **AWS Certificate Manager**: Issues and manages public SSL/TLS certificates.
* **CloudFlare**: Manage DNS records for the domain.

### Target architecture

<img width="700" height="421" alt="image" src="https://raw.githubusercontent.com/lfvaldezit/terraform-s3-website/main/image.png" />

## 🚀 Quick start

1. **Clone the repository**
 
 ```bash
 git clone <your-repo-url>
 cd terraform-s3-website
 ```
                                                                              
2. **Configure AWS credentials**

 ```bash
 aws configure
 ```

3. **Set up variables**

 ```
 * Adjust the terraform.tfvars & locals.tf variables as needed.

terraform.tfvars

# ------------------
# S3 Bucket 
# ------------------

bucket_name    = "terraform-multi-site-"
website_folder = "static-website/"

# ------------------
# ACM
# ------------------

validation_method      = "DNS"
create_route53_records = false
api_token              = "your_cloudflare_api_token"
zone_id                = "your_cloudflare_zone_id"
record_type            = "CNAME"
sites = { site-a = { subdomain = "site-a", path = "site-a" }
site-b = { subdomain = "site-b", path = "site-b" } }

locals.tf

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
}

 ```

4. **Initialize Terraform**

```bash
terraform init
```

5. **Plan the deployment**

 ```bash
 terraform plan -var-file terraform.tfvars
 ```

6. **Apply the infrastructure**

 ```bash
 terraform apply -var-file terraform.tfvars
 ```

 7. **DNS Validation**

 ```bash
module.acm.aws_acm_certificate_validation.this[0]: Still creating... [01m00s elapsed]
module.acm.aws_acm_certificate_validation.this[0]: Still creating... [01m10s elapsed]
module.acm.aws_acm_certificate_validation.this[0]: Still creating... [01m20s elapsed]
module.acm.aws_acm_certificate_validation.this[0]: Creation complete after 1m29s [id=0001-01-01 00:00:00 +0000 UTC]

 * Add the required CNAME records in CloudFlare before AWS can issue and validate 
   the SSL/TLS certificate for your site.
   Go to Additional Resources -> ACM DNS validation for detailed instructions

 ```

8. **Access the website**

 ```
 After deployment, Terraform will output the FQDN records.
  ```

## 📁 Project Structure

```
 ├── main.tf                     # Root configuration calling modules
 ├── outputs.tf                  # Module Outputs
 ├── versions.tf                 # Terraform and provider version constraints
 ├── providers.tf                # AWS provider configuration
 ├── static-website              # Folder containing static website files
 ├── modules/                    # Reusable modules
 │   └── cloudfront/              
 │   └── iam/          
 │   └── s3/ 
 │   └── cloudflare/  
 ├── locals.tf                   # Local variables
 ├── variables.tf                # Input variables
 └── terraform.tfvars            # Variables file
```

## 📊 Outputs

* **Records**: The FQDN of the deployed sites.

## 🧹 Cleanup

**To destroy all resources**

 ```bash
terraform destroy -var-file terraform.tfvars
 ```

## 📚 Additional Resources

* [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Terraform module to create AWS ACM resources](https://registry.terraform.io/modules/terraform-aws-modules/acm/aws/5.1.0)
* [ACM DNS validation](https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
