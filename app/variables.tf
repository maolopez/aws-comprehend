locals {
  region             = "us-east-1"
  project_name       = "test-${random_string.suffix.result}"
  awsaccount         = "271271282869"
  bucket_name_samples = "bucket-samples-${random_string.suffix.result}"
  object_name = "samples-${random_string.suffix.result}"
  source_object_path = "./Train.csv"
  job_name = "job-${random_string.suffix.result}"
  comprehend_role = "crole-${random_string.suffix.result}"
  comprehend_policy = "cpolicy-${random_string.suffix.result}"
}