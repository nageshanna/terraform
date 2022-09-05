resource "aws_instance" "web" {
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  
  tags = {
    Name = "HelloWorld"
  }
}
  resource "aws_iam_user" "example" {
     count = length(var.user_names)
     name  = var.user_names[count.index]
     
    }

variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = ["user1", "user2"]
}    