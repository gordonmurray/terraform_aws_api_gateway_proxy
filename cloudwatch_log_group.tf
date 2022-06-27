resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.lambda_function_name}_lambda_logs"
  retention_in_days = 1
}
