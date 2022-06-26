resource "aws_s3_bucket" "data_bucket" {
  bucket = "api-gateway-data-bucket"
}

resource "aws_s3_bucket_acl" "default" {
  bucket = aws_s3_bucket.data_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_notification" "data_bucket_notification" {
  bucket = aws_s3_bucket.data_bucket.id

  queue {
    queue_arn     = aws_sqs_queue.data_bucket_queue.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".json"
  }
}