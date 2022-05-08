resource "aws_api_gateway_rest_api" "default" {
  api_key_source               = "HEADER"
  binary_media_types           = ["*/*"]
  description                  = "API endpoint to receive webhook data"
  name                         = "receive-webhook"
  disable_execute_api_endpoint = "false"
  minimum_compression_size     = "-1"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

