resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 1

  tags = {
    Name      = "/aws/lambda/${var.lambda_function_name}"
  }
}