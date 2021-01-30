
/*
data "aws_vpc" "vpc"{
    filter{
      name="vpc-id"
      values=["vpc*"]
    }
  }

  data "aws_security_group" "sg"{
    filter{
      name="tag:Name"
      values=["web1"]
    }

    filter{
      name="vpc-id"
      values=[data.aws_vpc.vpc.id,]
    }
  }
  */
