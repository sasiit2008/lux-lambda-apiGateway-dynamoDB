# provider.tf

provider "aws" {
  region = var.region
  # access_key = var.accessKey
  # secret_key = var.secretKey
}

terraform {
  backend "s3" {}
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}