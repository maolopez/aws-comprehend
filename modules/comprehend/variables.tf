variable "region" {
  type        = string
  description = "default region"
}

variable "job_name" {
  type        = string
  description = "The name of the comprehend job"
}

variable "comprehend_role" {
  type        = string
  description = "The name of the comprehend role for the comprehend job"
}

variable "comprehend_policy" {
  type        = string
  description = "The name of the comprehend policy for the comprehend role"
}

variable "bucket_name_samples" {
  type        = string
  description = "bucket with folder containing public samples"
}

variable "object_name" {
  type        = string
  description = "name of the object in the bucket. Object has public samples"
}