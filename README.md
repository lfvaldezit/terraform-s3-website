# Terraform Module for S3 Static Website + CloudFront

## 🌐 Stack Overview

  <img width="691" height="421" alt="image" src="terraform-website\image.png" />

* **AWS S3**: Storage for static site files
* **AWS CloudFront**: Global Content Delivery Network (CDN)
* **AWS Certificate Manager**: Deploy public SSL/TLS certificate
* **CloudFlare**: Domain hosting for DNS records
* **IAM Policy**: Grants CloudFront access to S3

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
 Copy the content ofs terraform.tfvars.example
 Create your own terraform.tfvars file and adjust the values
 Update the variables locals.tf as needed
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

7. **Access the website**

 ```
 After deployment, Terraform will output the CloudFront distribution URL
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
 │   └── acm/ 
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


3. **CloudFlare**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `api_token`| The API Token for operations | `string` | None | **Yes** |
| `zone_id` | The zone identifier to target for the resource | `string` | None | **Yes** |
| `record_name` | The name of the record | `string` | None | **Yes** |
| `record_content` | The content of the record | `string` | None | **Yes** |

4. **Locals**

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `profile` | Allows you to store and manage AWS credentials | `string` | default | **Yes** |
| `domain_name` | The name of the hosted zone | `string` | example.com | **Yes** |
| `aws_region` | AWS Region where the provider will operate | `map(string)` | us-east-1 | **Yes** |
| `common_tags` | Common tags for all resources | `string` |  | **No** |


## 📊 Outputs

* **Domain-validation-option**: Set of domain validation objects which can be used to complete certificate validation
* **hostname**: The FQDN of the record