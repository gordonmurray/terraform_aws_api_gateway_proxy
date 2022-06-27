resource "aws_api_gateway_integration_response" "api_options" {
  http_method = aws_api_gateway_method.options.http_method
  resource_id = aws_api_gateway_resource.resource.id

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'*'"
    "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  rest_api_id = aws_api_gateway_rest_api.default.id
  status_code = aws_api_gateway_method_response.options.status_code
}

resource "aws_api_gateway_integration_response" "api_post" {
  http_method = aws_api_gateway_method.post.http_method
  resource_id = aws_api_gateway_resource.resource.id

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  rest_api_id = aws_api_gateway_rest_api.default.id
  status_code = aws_api_gateway_method_response.post.status_code
}
