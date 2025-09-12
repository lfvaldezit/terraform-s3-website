data "aws_iam_policy_document" "this" {

  statement {

    principals {
      identifiers = [ "cloudfront.amazonaws.com" ]
      type = "Service"
    }

    actions = [ "s3:GetObject" ]
    resources = [ "${var.aws_s3_bucket_arn}/*" ]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [var.cloudfront_dist_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = var.aws_s3_bucket_id
  policy = data.aws_iam_policy_document.this.json
}
