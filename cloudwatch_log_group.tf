resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/lambda_logs"
  retention_in_days = 1
}
