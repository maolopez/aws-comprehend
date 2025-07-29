variable "region" {
  type        = string
  description = "default region"
}

variable "bucket_name_samples" {
  type        = string
  description = "bucket with folder containing public samples"
}

variable "object_name" {
  type        = string
  description = "name of the object in the bucket. Object has public samples"
}

variable "source_object_path {
  type        = string
  description = "Source of the object going to bucket s3"
}