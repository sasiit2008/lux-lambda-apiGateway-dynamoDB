data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/index.js.zip"
}

resource "aws_lambda_function" "get" {
  function_name = "${var.project}-${var.environment}-lambda"
  filename      = "${path.module}/index.js.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.iam_for_lambda.arn
  timeout       = 30
  tags          = merge({ Name = "${var.project}-${var.environment}-lambda" }, tomap(var.additional_tags))
}

resource "aws_cloudwatch_log_group" "get" {
  name              = "/aws/lambda/${var.project}-${var.environment}-lambda"
  retention_in_days = 14
}
