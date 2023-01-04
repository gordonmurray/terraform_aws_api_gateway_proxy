resource "aws_s3_bucket" "data_bucket" {
  bucket = "api-gateway-data-bucket"
}

resource "aws_s3_bucket_acl" "default" {
  bucket = aws_s3_bucket.data_bucket.id
  acl    = "private"
}