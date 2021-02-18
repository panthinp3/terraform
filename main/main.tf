

module "ec2"{

  source = "../modules/ec2"

  pub_subnet_id= module.vpc.public_subnet
  pub_sec_grp= module.sec_grp.public_sec_grp

  pri_subnet_id= module.vpc.private_subnet
  pri_sec_grp= module.sec_grp.private_sec_grp
}
/*
module "sec_grp"{
  source = "../modules/sec_grp"
  vpc_id=module.vpc.vpc_id
  
}
i
module "vpc"{
  source = "../modules/vpc"
  
}


module "iam_user"{
  source = "../modules/iam_user"
  
}

/*
module "s3_bucket"{
  source = "../modules/s3_bucket"
  
}

*/



 


 
