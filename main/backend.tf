
terraform {
  backend "s3" {
    bucket = "back-bucket-01"
    key= "terraform_file/terraform.tfstate"
    region = "us-east-1"
  }
}