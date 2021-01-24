 
output "result1"{
    description = "VPC ID is: "
    value=data.aws_vpc.vpc.id
  }

  output "result2"{
    description = "Security Group is: "
    value=data.aws_security_group.sg.id
  }
  