resource "aws_api_gateway_method_response" "options" {
  http_method = "OPTIONS"
  resource_id = aws_api_gateway_resource.resource.id
  rest_api_id = aws_api_gateway_rest_api.default.id
  status_code = "200"
  depends_on  = [aws_api_gateway_integration.options]

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "false"
    "method.response.header.Access-Control-Allow-Methods" = "false"
    "method.response.header.Access-Control-Allow-Origin"  = "false"
  }


}

resource "aws_api_gateway_method_response" "post" {
  http_method = "POST"
  resource_id = aws_api_gateway_resource.resource.id
  rest_api_id = aws_api_gateway_rest_api.default.id
  status_code = "200"
  depends_on  = [aws_api_gateway_integration.post]

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "false"
  }
}
