resource "aws_instance" "server3" {
  ami           = "ami-068cda7597e78094b"
  instance_type = "t2.micro"
  key_name = "tff_key"
  tags = {
    Name = "server3"
  }
}
#####Key_pair############
resource "aws_key_pair" "tff_key" {
  key_name   = "tff_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "tff_key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
}