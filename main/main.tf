terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.24"
    }
  }
}

module "new_module"{
  source = "../modules/module1"
  select_region=var.region
}



 


 