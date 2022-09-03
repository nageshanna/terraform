
resource "aws_instance" "web" {
  ami              = "ami-06489866022e12a14"
  instance_type    = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  tags = {
    Name = "server1"
  }
}

