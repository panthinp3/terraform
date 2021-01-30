/* 
output "result1"{
    description = "VPC ID is: "
    value=data.aws_vpc.vpc.id
  }

  output "result2"{
    description = "Security Group is: "
    value=data.aws_security_group.sg.id
  }
  
  */

  output "public_sec_grp" {
    value=aws_security_group.public_sec_grp.id
    
  }

  output "private_sec_grp" {
    value=aws_security_group.private_sec_grp.id
    
  }