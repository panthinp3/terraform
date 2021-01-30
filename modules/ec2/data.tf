

data "aws_ami" "create_ami"{
  most_recent = true
  filter{
    name="name"
    values = [ "amzn2*" ]
  }

  filter{
    name="image-id"
    values = [ "ami*" ]
  }

  filter{
    name="virtualization-type"
    values = [ "hvm" ]
  }

  filter{
    name="root-device-type"
    values = [ "ebs" ]
  }

  owners = [ "amazon" ]
}

data "aws_vpc" "vpc"{
    filter{
      name="vpc-id"
      values=["vpc*"]
    }
  }
/*
  data "aws_security_group" "sg"{
    filter{
      name="tag:Name"
      values=["web1"]
    }

    filter{
      name="vpc-id"
      values=[data.aws_vpc.vpc.id,]
    }
  }*/