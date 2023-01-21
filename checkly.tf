resource "checkly_check" "api_gateway_check" {
  name                      = "AWS API Gateway API check"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 10
  double_check              = true
  use_global_alert_settings = true

  locations = [
    "eu-west-1",
    "eu-west-2"
  ]

  tags = ["AWS", "Terraform"]

  request {
    url              = "${aws_api_gateway_deployment.default.invoke_url}/upload"
    follow_redirects = true
    body_type        = "JSON"
    method           = "POST"
    body             = jsonencode({ "hello" = "world" })

    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
  }
}
