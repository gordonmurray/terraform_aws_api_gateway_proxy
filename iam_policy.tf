resource "aws_iam_policy" "policy_logs" {
  name        = "allow-log-permissions-policy"
  description = "Lambda"
  path        = "/service-role/"

  tags = {
    Name      = "allow-log-permissions-policy"
  }

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.lambda_function_name}:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}