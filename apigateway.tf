# Create API Gateway
resource "aws_api_gateway_rest_api" "uppercase_api" {
  name = var.api_gateway_name
}

resource "aws_api_gateway_resource" "uppercase_resource" {
  rest_api_id = aws_api_gateway_rest_api.uppercase_api.id
  parent_id   = aws_api_gateway_rest_api.uppercase_api.root_resource_id
  path_part   = var.api_gateway_resource_path
}

resource "aws_api_gateway_method" "uppercase_method" {
  rest_api_id   = aws_api_gateway_rest_api.uppercase_api.id
  resource_id   = aws_api_gateway_resource.uppercase_resource.id
  http_method   = var.api_gateway_method
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "uppercase_method_response" {
  rest_api_id = aws_api_gateway_rest_api.uppercase_api.id
  resource_id = aws_api_gateway_resource.uppercase_resource.id
  http_method = var.api_gateway_method
  status_code = "200"
  depends_on = [aws_api_gateway_method.uppercase_method]

}

# Link API Gateway to Lambda
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.uppercase_api.id
  resource_id             = aws_api_gateway_resource.uppercase_resource.id
  http_method             = aws_api_gateway_method.uppercase_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.uppercase_api.invoke_arn
  depends_on = [aws_api_gateway_method_response.uppercase_method_response]

}

# Deploy the API
resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on  = [
    aws_api_gateway_integration.lambda_integration,
    aws_api_gateway_method_response.uppercase_method_response
  ]

  rest_api_id = aws_api_gateway_rest_api.uppercase_api.id
  stage_name  = var.api_gateway_stage_name
}

# Allow Lambda to be invoked by API Gateway
resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.uppercase_api.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.uppercase_api.execution_arn}/*/*"
}

output "api_url" {
  value = "${aws_api_gateway_deployment.api_deployment.invoke_url}/uppercase"
}