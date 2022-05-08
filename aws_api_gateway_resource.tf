resource "aws_api_gateway_resource" "resource" {
  path_part   = "upload"
  parent_id   = aws_api_gateway_rest_api.default.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.default.id
}