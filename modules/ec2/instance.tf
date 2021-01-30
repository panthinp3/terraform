

resource "aws_instance" "public" {

  ami           = data.aws_ami.create_ami.id
  //ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  key_name= "panthinp3"
  subnet_id=var.pub_subnet_id
  vpc_security_group_ids = [var.pub_sec_grp]
  user_data = <<-EOF
  #!/bin/bash
  yum -y install httpd
  systemctl start httpd
  systemctl enable httpd
  echo "This is from terraform with security group using data"  >var/www/html/index.html
  EOF

  tags = {
    "Name" = "public_instance"
  }

}


resource "aws_instance" "private" {

  ami           = data.aws_ami.create_ami.id
  //ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  subnet_id = var.pri_subnet_id
  vpc_security_group_ids = [var.pri_sec_grp]
  
  tags = {
    "Name" = "private_instance"
  }
}