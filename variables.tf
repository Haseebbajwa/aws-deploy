variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string  # Change to your desired region
}

variable "lambda_role_name" {
  description = "IAM role name for Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_filename" {
  description = "Name of the zip file containing Lambda function"
  type        = string

}

variable "lambda_handler" {
  description = "Handler for Lambda function"
  type        = string

}

variable "lambda_runtime" {
  description = "Runtime environment for Lambda function"
  type        = string
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
}

variable "api_gateway_resource_path" {
  description = "Resource path for API Gateway"
  type        = string
}

variable "api_gateway_method" {
  description = "HTTP method for API Gateway"
  type        = string
  default     = "POST"
}

variable "api_gateway_stage_name" {
  description = "Deployment stage name for API Gateway"
  type        = string

}
