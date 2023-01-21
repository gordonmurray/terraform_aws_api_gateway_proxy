variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "lambda_function_name" {
  type    = string
  default = "api_gateway_lambda_function"
}

variable "checkly_api_key" {
  type = string

}

variable "checkly_account_id" {
  type = string

}