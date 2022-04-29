resource "aws_s3_bucket" "default" {
  bucket = "api-gateway-data-bucket"
}

resource "aws_s3_bucket_acl" "default" {
  bucket = aws_s3_bucket.default.id
  acl    = "private"
}
