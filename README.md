# Host Multiple Static Websites with Subdomains using S3 + CloudFront (OAC + Function)

## 🏗️ Architecture

      <img width="700" height="421" alt="image" src="https://raw.githubusercontent.com/lfvaldezit/terraform-s3-website/main/image.png" />

* **AWS S3**: Stores static site files.
* **AWS CloudFront**: Global Content Delivery Network (CDN).
* **AWS CloudFront Function**: Routes each subdomain into its folder.
* **AWS Certificate Manager**: Issues and manages public SSL/TLS certificates.
* **CloudFlare**: Manage DNS records for the domain.

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
 * Copy the contents of terraform.tfvars.example into a new file named terraform.tfvars 
   and adjust the values.
 * Update variables in locals.tf as needed.
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
 * Add the required CNAME records in CloudFlare before AWS can issue and validate 
   the SSL/TLS certificate for your site.
   Go to Additional Resources -> ACM DNS validation for detailed instructions
 ```

8. **Access the website**

 ```
 After deployment, Terraform will output the FQDN record
  ```

## 📁 Project Structure

```
 ├── main.tf                     # Root configuration calling modules
 ├── outputs.tf                  # Module Outputs
 ├── versions.tf                 # Terraform and provider version constraints
 ├── providers.tf                # AWS provider configuration
 ├── static-site                 # Folder containing static website files
 ├── modules/                    # Reusable modules
 │   └── cloudfront/            
 │   │   ├── main.tf
 │   │   ├── variables.tf
 │   │   └── outputs.tf     
 │   └── iam/ 
 │   │    ├── main.tf
 │   │    ├── variables.tf
 │   │    └── outputs.tf          
 │   └── s3/ 
 │        ├── main.tf
 │        ├── variables.tf
 │        └── outputs.tf
 │   └── cloudflare/ 
 │        ├── main.tf
 │        ├── variables.tf
 │        └── outputs.tf  
 ├── locals.tf                   # Local variables
 ├── variables.tf                # Input variables
 └── terraform.example.tfvars    # Example variables file
```

## ⚙️ Configuration

### Variables

1. **S3**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `bucket_name` | Globally unique S3 bucket name | `string` | none | **Yes** |
| `s3_tags` | S3 bucket tags | `map(string)` | default | **No** |
| `website_folder` | Folder containing the website | `string` | static-website/ | **Yes** |

2. **CloudFront**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `aliases` | Extra CNAMEs (alternate domain names) | `set(string)` | default | **Yes** |
| `cfn_tags` | CloudFront bucket tags | `map(string)` | default | **No** |


3. **Cloudflare**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `api_token`| The API Token for operations | `string` | None | **Yes** |
| `zone_id` | The zone identifier to target for the resource | `string` | None | **Yes** |
| `record_name` | The name of the record | `string` | None | **Yes** |
| `record_content` | The content of the record | `string` | None | **Yes** |

4. **Certificate Manager**

* Use this module: **Terraform module to create AWS ACM resources** to provision SSL/TLS certificates

5. **Locals**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `profile` | Allows you to store and manage AWS credentials | `string` | default | **Yes** |
| `domain_name` | The name of the hosted zone | `string` | example.com | **Yes** |
| `aws_region` | AWS Region where the provider will operate | `string` | us-east-1 | **Yes** |
| `common_tags` | Common tags for all resources | `string` |  | **No** |

## 📊 Outputs

* **hostname**: The FQDN of the deployed site.

## 🧹 Cleanup

**To destroy all resources**

 ```bash
terraform destroy -var-file terraform.tfvars
 ```

## 📚 Additional Resources

* [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Terraform module to create AWS ACM resources](https://registry.terraform.io/modules/terraform-aws-modules/acm/aws/5.1.0)
* [ACM DNS validation](https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html)
