resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
    force_destroy = true
    tags = merge({Name = "${var.bucket_name}"},var.common_tags)
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "null_resource" "upload_website" {  
  provisioner "local-exec" {
    command = "aws s3 cp ${var.website_folder} s3://${aws_s3_bucket.this.id}/ --recursive --profile ${var.aws_profile}"
  }
}
