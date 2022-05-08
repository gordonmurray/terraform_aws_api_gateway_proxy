resource "aws_iam_role_policy_attachment" "default" {
  policy_arn = aws_iam_policy.policy_logs.arn
  role       = aws_iam_role.iam_role_for_lambda.name
}
