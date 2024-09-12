variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string  # Change to your desired region
  default     = "eu-west-1"
}



variable "lambda_role_arn" {
  description = "arn of lambda execution role"
  type        = string
  default     = "arn:aws:iam::820242942459:role/my_lambda_role"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "my-uppercase-api"
}

variable "lambda_filename" {
  description = "Name of the zip file containing Lambda function"
  type        = string
  default = "lambda_function.zip"

}

variable "lambda_handler" {
  description = "Handler for Lambda function"
  type        = string
  default = "my_lambda_function.lambda_handler"

}

variable "lambda_runtime" {
  description = "Runtime environment for Lambda function"
  type        = string
  default = "python3.9"
}

variable "lambda_environment_variables" {
  description = "Environment variables for Lambda function"
  type        = map(string)
  default     = {
    ENV = "development"
  }
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "My Uppercase API"
}

variable "api_gateway_resource_path" {
  description = "Resource path for API Gateway"
  type        = string
  default = "uppercase"
}

variable "api_gateway_method" {
  description = "HTTP method for API Gateway"
  type        = string
  default     = "POST"
}

variable "api_gateway_stage_name" {
  description = "Deployment stage name for API Gateway"
  type        = string
  default = "development"
}
