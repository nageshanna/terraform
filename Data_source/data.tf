data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["defaultsubnet"]
  }
}