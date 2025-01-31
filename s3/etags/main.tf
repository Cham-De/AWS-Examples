terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "random_uuid" "bucket_suffix" {}

resource "aws_s3_bucket" "examplebucket" {
  bucket = "my-tf-test-bucket${replace(lower(random_uuid.bucket_suffix.result), "-", "")}"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.examplebucket.id 
  key    = "myfile.txt"
  source = "../bash_scripts/create_bucket"
  etag = filemd5("../bash_scripts/create_bucket")
}