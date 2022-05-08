resource "aws_iam_role" "iam_role_for_lambda" {
  name = "iam_role_for_lambda"
  path = "/service-role/"
  managed_policy_arns = [
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