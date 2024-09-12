
# Create the Lambda function
resource "aws_lambda_function" "uppercase_api" {
  filename         = var.lambda_filename
  function_name    = var.lambda_function_name
  role             = var.lambda_role_arn
  handler          = var.lambda_handler
  source_code_hash = filebase64sha256(var.lambda_filename)
  runtime          = var.lambda_runtime

  # Environment variables if needed
  environment {
    variables = var.lambda_environment_variables
  }
}
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/${aws_lambda_function.uppercase_api.function_name}"
}
