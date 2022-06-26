resource "aws_lambda_function" "default" {
  architectures    = ["x86_64"]
  filename         = "lambda_function.zip"
  function_name    = "lambda_function"
  role             = aws_iam_role.iam_role_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  memory_size      = "128"
  package_type     = "Zip"
  timeout          = "3"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime          = "python3.9"

  ephemeral_storage {
    size = "512"
  }

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.data_bucket.id
    }
  }
}
