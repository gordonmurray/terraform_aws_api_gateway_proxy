output "post_data_to" {
  description = "Deployment invoke url"
  value       = "${aws_api_gateway_deployment.default.invoke_url}/${var.lambda_function_name}"
}


# Export Terraform variable values to an Ansible var_file
resource "local_file" "tf_ansible_vars_file_new" {
  content  = <<-DOC
    # Generated by Terraform

    api_url: "${aws_api_gateway_deployment.default.invoke_url}/${var.lambda_function_name}"
    DOC
  filename = "./ansible/roles/test/vars/main.yml"
}