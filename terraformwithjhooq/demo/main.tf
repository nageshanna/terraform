resource "aws_instance" "web" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  associate_public_ip_address = var.disable_public_ip
  tags = {
    Name = "HelloWorld"
  }
}
variable "disable_public_ip" {
  description = "This variable is used to aoosociates public ip address to ec2 instance."
  type = bool
  default = false
}
