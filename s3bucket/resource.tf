resource "aws_s3_bucket" "mybucket_302" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "Mybucket_302"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "access_control" {
  bucket = "aws_s3_bucket.mybucket_302.id"
  acl    = "private"
}