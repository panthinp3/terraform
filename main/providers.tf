terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.24"
    }
  }
}


provider "aws" {
  profile = "default"
  region= var.region
}