resource "aws_api_gateway_method" "post" {
  api_key_required = "false"
  rest_api_id      = aws_api_gateway_rest_api.default.id
  resource_id      = aws_api_gateway_resource.resource.id
  http_method      = "POST"
  authorization    = "NONE"
}

resource "aws_api_gateway_method" "options" {
  api_key_required = "false"
  authorization    = "NONE"
  http_method      = "OPTIONS"
  rest_api_id      = aws_api_gateway_rest_api.default.id
  resource_id      = aws_api_gateway_resource.resource.id
}
