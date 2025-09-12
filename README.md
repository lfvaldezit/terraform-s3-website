# Terraform Module for S3 Static Website + CloudFront

## 🌐 Stack Overview

* **AWS S3**: Secure storage for static site files
* **AWS CloudFront**: Global Content Discovery Network
* **IAM Policy**: Permission for access from CloudFront to S3

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

   ```bash
   Copy terraform.tfvars.example content
   # Edit your own terraform.tfvars with your own variables
   # Change locals.tf variables with your own
   ```

4. **Initialize Terraform**

   ```bash
   terraform init
   ```

5. **Plan & Apply the infrastructure**

   ```bash
   terraform plan -var-file terraform.tfvars
   terraform apply -var-file terraform.tfvars
   ```

6. **Access website**
    After deployment, Terraform will output the CloudFront distribution URL

    ## 📁 Project Structure

    ```
  
    ├── main.tf                     # Main configuration calling the static_site module
    ├── outputs.tf                  # Module Outputs
    ├── versions.tf                 # Terraform and provider version constraints
    ├── providers.tf                # AWS provider configuration
    ├── static-site                 # Folder where to upload static site
    ├── modules/                    # Reusable modules
    │   └── cloudfront/            
    │       ├── main.tf
    │       ├── variables.tf
    │       └──  output.tf     
    │   └── iam/ 
    │       ├── main.tf
    │       ├── variables.tf
    │       └──  output.tf          
    │   └── s3/ 
    │       ├── main.tf
    │       ├── variables.tf
    │       └──  output.tf    
    ├── locals.tf                   # Module locals
    ├── variables.tf                # Input variables
    └──  terraform.example.tfvars   # Set up variables
    ```