# Terraform Module for S3 Static Website + CloudFront

## 🌐 Stack Overview

* **AWS S3**: Storage for static site files
* **AWS CloudFront**: Global Content Delivery Network (CDN)
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
 ├── locals.tf                   # Local variables
 ├── variables.tf                # Input variables
 └── terraform.example.tfvars    # Example variables file
```

## ⚙️ Configuration

### Variables

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `bucket_name` | Globally unique S3 bucket name | `string` | none | **Yes** |
| `s3_tags` | S3 bucket tags | `map(string)` | None | **Yes** |
| `cfn_tags` | CloudFront tags | `map(string)` | None | **Yes** |
| `website_folder` | Folder containing the website | `string` | static-site | **Yes** |

### Locals

| Variable     | Description                  | Type     | Default     | Required |
| ------------ | ---------------------------- | -------- | ----------- | -------- |
| `profile` | AWS CLI profile to use | `string` | default | **Yes** |
| `aws_region` | AWS region for all resources | `(string)` | us-east-1 | **Yes** |
| `common_tags` | Common tags for all resources | `map(string)` | None | **No** |


## 📊 Output

* CloudFront distribution URL