 resource "aws_security_group" "public_sec_grp"{
    description = "Allow ssh and http traffic"

    vpc_id = var.vpc_id

    ingress{
        from_port=0
        to_port=0
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }


    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags = {
    Name = "my_public_sec"
  }
  
}


resource "aws_security_group" "private_sec_grp" {
   // name = "vpc_db"
    description = "Allow incoming database connections for private."

    vpc_id = var.vpc_id

    /*ingress { # SQL Server
        from_port = 1433
        to_port = 1433
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }
    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }*/

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "my_private_sec"
  }
}