# lambda.tf

data "archive_file" "lambda" {
  type        = "zip"
  source_dir = "${path.module}/deployment-files"
  output_path = "${path.module}/deployment-files.zip"
}

resource "aws_lambda_function" "translate" {
  function_name = "${var.project}-translate-${var.environment}"
  filename      = "${path.module}/deployment-files.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.iam_for_lambda.arn
  timeout       = 30
  tags          = merge({ Name = "${var.project}-translate-${var.environment}-lambda" }, tomap(var.additional_tags))
}

resource "aws_cloudwatch_log_group" "translate" {
  name              = "/aws/lambda/${var.project}-translate-${var.environment}"
  retention_in_days = 14
}

resource "aws_lambda_function" "chatbot" {
  function_name = "${var.project}-chatbot-${var.environment}"
  filename      = "${path.module}/index.js.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.iam_for_lambda.arn
  timeout       = 30
  tags          = merge({ Name = "${var.project}-chatbot-${var.environment}-lambda" }, tomap(var.additional_tags))
}

resource "aws_cloudwatch_log_group" "chatbot" {
  name              = "/aws/lambda/${var.project}-chatbot-${var.environment}"
  retention_in_days = 14
}
