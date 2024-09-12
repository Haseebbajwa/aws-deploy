resource "aws_kms_key" "lambda_key" {
  description = "KMS key for Lambda environment variable encryption"
}

resource "aws_kms_alias" "lambda_key_alias" {
  name          = "alias/lambda_key"
  target_key_id  = aws_kms_key.lambda_key.id
}

resource "aws_kms_key_policy" "lambda_key_policy" {
  key_id = aws_kms_key.lambda_key.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "kms:Decrypt"
        Resource = "*"
        Condition = {
          StringEquals = {
            "kms:EncryptionContext:aws:lambda:arn" = aws_lambda_function.uppercase_api.arn
          }
        }
      }
    ]
  })
}
