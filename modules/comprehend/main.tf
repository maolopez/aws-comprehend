provider "aws" {
  region = var.region
}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "comprehend_role" {
  name = var.comprehend_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "comprehend.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "comprehend_full_access" {
  role       = aws_iam_role.comprehend_role.name
  policy_arn = "arn:aws:iam::aws:policy/ComprehendFullAccess"
}

resource "aws_iam_policy" "comprehend_policy" {
  name   = var.comprehend_policy
  policy = file("../modules/comprehend/comprehend_policy.json")
}

resource "aws_iam_role_policy_attachment" "attach_comprehend_policy" {
  policy_arn = aws_iam_policy.comprehend_policy.arn
  role       = aws_iam_role.comprehend_role.name
}

resource "aws_comprehend_document_classifier" "classifier" {
  name   = var.job_name
  region = var.region
  input_data_config {
    s3_uri = "s3://${var.bucket_name_samples}/${var.object_name}"
  }
  language_code        = "en"
  data_access_role_arn = aws_iam_role.comprehend_role.arn
  depends_on = [
    aws_iam_policy.comprehend_policy
  ]
}
