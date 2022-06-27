output "post_data_to" {
  description = "Deployment invoke url"
  value       = "${aws_api_gateway_deployment.default.invoke_url}/${var.lambda_function_name}"
}
