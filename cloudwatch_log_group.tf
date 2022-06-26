resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/api_gateway_lambda_logs"
  retention_in_days = 1
}
