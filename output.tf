output "deployment_invoke_url" {
  description = "Deployment invoke url"
  value       = aws_api_gateway_deployment.default.invoke_url
}

output "name" {
  description = "API Gateway name"
  value       = aws_api_gateway_rest_api.default.name
}