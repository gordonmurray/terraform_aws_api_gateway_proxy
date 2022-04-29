resource "aws_lambda_function" "default" {

  filename      = "lambda_code.zip"
  function_name = "lambda_code"
  role          = aws_iam_role.iam_role_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("lambda_code.zip")

  runtime = "python3.8"

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.default.id
    }
  }
}
