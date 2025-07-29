provider "aws" {
  region = var.region
}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "samples" {
  bucket        = var.bucket_name_samples
  region        = var.region
  force_destroy = true
}

resource "aws_s3_object" "sample_object" {
  bucket        = aws_s3_bucket.samples.id
  key           = var.object_name
  source        = var.source_object_path
  force_destroy = true

  depends_on = [aws_s3_bucket.samples]
}

