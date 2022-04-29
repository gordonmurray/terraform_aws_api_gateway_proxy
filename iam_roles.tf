resource "aws_iam_role" "iam_role_for_lambda" {
  name = "iam_role_for_lambda"
  path = "/service-role/"
  managed_policy_arns = [
    aws_iam_policy.policy_s3.arn,
    aws_iam_policy.policy_logs.arn

  ]

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "policy_logs" {
  name        = "allow-log-permissions-policy"
  description = "Allow logs to be created"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:016230046494:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:016230046494:log-group:/aws/lambda/my-test-function-gordon:*"
            ]
        }
    ]
}
EOF
}


resource "aws_iam_policy" "policy_s3" {
  name        = "allow-s3-permissions-policy"
  description = "Allow s3 objects to be created"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}