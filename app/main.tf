resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

module "s3" {
  source = "../modules/s3"

  region        = local.region
  project       = local.project
  bucket_name_samples = local.bucket_name_samples
  object_name = local.object_name
  source_object_path = local.source_object_path
}

module "comprehend" {
    source = "../modules/comprehend"
    job_name = local.job_name
    comprehend_role = local.comprehend_role
    comprehend_policy = local.comprehend_policy
    bucket_name_samples = local.bucket_name_samples
    object_name = local.object_name    
}