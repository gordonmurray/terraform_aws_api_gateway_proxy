resource "aws_sqs_queue" "data_bucket_queue" {
  name = "api-gateway-bucket-events"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:api-gateway-bucket-events",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.data_bucket.arn}" }
      }
    }
  ]
}
POLICY
}

