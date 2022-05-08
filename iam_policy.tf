resource "aws_iam_policy" "policy_logs" {
  name        = "allow-log-permissions-policy"
  description = "Lambda"
  path        = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:016230046494:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:016230046494:log-group:/aws/lambda/lambda_logs:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}