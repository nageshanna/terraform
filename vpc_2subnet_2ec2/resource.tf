###VPC######
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}
####Subnets#####
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "subnet1"
  }
}
####Subnets#####
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet2"
  }
}
####Internet_Gateway#####
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_vpc"
  }
}
#####Route_Table#####
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route = []

  tags = {
    Name = "route_table"
  }
}
#####Security_Group##########
resource "aws_security_group" "sg" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0 #All traffic
    to_port          = 0 # All traffic
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg"
  }
}
#####Route######
resource "aws_route" "r" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.route_table]
}
#####Route_submission########
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
}
#####Route_submission########
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table.id
}
######Ec2 instance#######
resource "aws_instance" "server1" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  tags = {
    Name = "server1"
  }
}
######Ec2 instance#######
resource "aws_instance" "server2" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  subnet_id     = aws_subnet.subnet2.id
  tags = {
    Name = "server2"
  }
}


















