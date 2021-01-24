resource "aws_instance" "example" {

  ami           = data.aws_ami.create_ami.id
  //ami           = "ami-0be2609ba883822ec"
  vpc_security_group_ids =[data.aws_security_group.sg.id, aws_security_group.ssh_http_SG.id]
  instance_type = "t2.micro"
  user_data = <<-EOF
  #!/bin/bash
  yum -y install httpd
  systemctl start httpd
  systemctl enable httpd
  echo "This is from terraform with security group using data"  >var/www/html/index.html
  EOF

}