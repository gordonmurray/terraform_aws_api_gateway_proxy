resource "aws_api_gateway_rest_api" "default" {

  binary_media_types = ["*/*"]

  description = "API endpoint to receive webhook data"

  name = "receive-webhook"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.default.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "default" {
  deployment_id = aws_api_gateway_deployment.default.id
  rest_api_id   = aws_api_gateway_rest_api.default.id
  stage_name    = "test"
}


resource "aws_api_gateway_resource" "resource" {
  path_part   = "resource"
  parent_id   = aws_api_gateway_rest_api.default.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.default.id
}


resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.default.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "POST"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "lambda" {
  rest_api_id             = aws_api_gateway_rest_api.default.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.default.invoke_arn
}


resource "aws_api_gateway_gateway_response" "default" {
  rest_api_id   = aws_api_gateway_rest_api.default.id
  response_type = "UNAUTHORIZED"
  status_code   = "200"


  response_templates = {
    "application/json" = "{\"message\":$context.error.messageString}"
  }
}

resource "aws_api_gateway_model" "default" {
  rest_api_id  = aws_api_gateway_rest_api.default.id
  name         = "Empty"
  description  = "An empty schema"
  content_type = "application/json"

  schema = <<EOF
{
  "type": "object"
}
EOF
}
