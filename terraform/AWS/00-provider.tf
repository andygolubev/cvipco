terraform {

    # for AWS Enable this section after provisioning of S3 and DynamoDB table
    #
    backend "s3" {
        bucket = "devops-directive-tf-state-77665550"
        key = "tf-infra/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-state-locking"
        encrypt = true
    }
    # end

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = " ~> 4.0"
        }
  }

}

provider "aws" {
    region =  "us-east-1"
}


# S3 bucket (encrypted) for Terraform STATE file

resource "aws_s3_bucket" "terraform-state" {
    bucket = "devops-directive-tf-state-77665550"
    force_destroy = true

}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
    bucket = aws_s3_bucket.terraform-state.id
    versioning_configuration {
    status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform-state-encryption" {
    bucket = aws_s3_bucket.terraform-state.id
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  
}

# DynamoDB table for LOCKs storage

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  
}


