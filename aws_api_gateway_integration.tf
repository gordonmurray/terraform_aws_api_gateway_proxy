resource "aws_api_gateway_integration" "lambda" {
  rest_api_id             = aws_api_gateway_rest_api.default.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.post.http_method
  integration_http_method = aws_api_gateway_method.post.http_method
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.default.invoke_arn
  connection_type         = "INTERNET"
  timeout_milliseconds    = "29000"
}
