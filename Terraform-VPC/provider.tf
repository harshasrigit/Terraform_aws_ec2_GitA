terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }


backend "s3" {
    bucket = "harshas31231"
    key    = "env:/terraform.tfstate"
    region = "eu-north-1"  # Ensure this matches the region of your S3 bucket
  }

}

provider "aws" {
   region = "eu-north-1"
  }
