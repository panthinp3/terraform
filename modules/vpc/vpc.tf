/*vpc
subnet
gateway
route table
security group
network interface*/

//Creating vpc

resource "aws_vpc" "my_vpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames=true

  tags = {
    Name = "my_vpc1"
  }
}

//<<<<<<<<<<<<<<<<<<<< PUBLIC SUBNET >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
//Creating public subnet

resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.my_vpc1.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
    Name = "my_public_subnet"
  }
}


//creating gateway
resource "aws_internet_gateway" "gateway" {
 vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_gateway"
  }
}

//creating route table for public
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc1.id

  route {
    cidr_block = "10.10.1.0/24"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "my_public_route_table"
  }
}

//connecting public subnet with route table
resource "aws_route_table_association" "public_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}

//<<<<<<<<<<<<<<<<<<<< PRIVATE SUBNET >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

//Creating private subnet

resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.my_vpc1.id
    cidr_block = "10.0.2.0/24"
     map_public_ip_on_launch = false
    tags = {
    Name = "my_private_subnet"
  }
}

/*//creating gateway
resource "aws_internet_gateway" "private_gateway" {
 vpc_id = aws_vpc.my_vpc1.id

  tags = {
    Name = "my_gateway"
  }
}*/

//creating route table for private
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc1.id

  route {
    cidr_block = "10.10.2.0/24"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "my_private_route_table"
  }
}



//connecting private subnet with route table
resource "aws_route_table_association" "private_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}