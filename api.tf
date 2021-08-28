# # api.tf

resource "aws_api_gateway_rest_api" "getTranslation" {
  api_key_source               = "HEADER"
  description                  = "API to trigger lambda for translation"
  disable_execute_api_endpoint = false
  minimum_compression_size     = -1
  name                         = "getTranslation"
  tags                         = merge({ Name = "${var.project}-${var.environment}-getTranslation-apigateway" }, tomap(var.additional_tags))
  endpoint_configuration {
    types = [
      "REGIONAL",
    ]
  }
}

resource "aws_api_gateway_resource" "getTranslation" {
  path_part   = "gettranslatetdtext"
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  parent_id   = aws_api_gateway_rest_api.getTranslation.root_resource_id
}

resource "aws_api_gateway_method" "getTranslation" {
  api_key_required   = false
  authorization      = "NONE"
  http_method        = "POST"
  request_models     = {}
  request_parameters = {}
  rest_api_id        = aws_api_gateway_rest_api.getTranslation.id
  resource_id        = aws_api_gateway_resource.getTranslation.id
}

resource "aws_api_gateway_method_response" "getTranslation" {
  http_method = "POST"
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  resource_id = aws_api_gateway_resource.getTranslation.id
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
  status_code = "200"
}

resource "aws_api_gateway_integration" "getTranslation" {
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "POST"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_MATCH"
  request_parameters      = {}
  request_templates       = {}
  rest_api_id             = aws_api_gateway_rest_api.getTranslation.id
  resource_id             = aws_api_gateway_resource.getTranslation.id
  timeout_milliseconds    = 29000
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.translate.arn}/invocations"
}

resource "aws_api_gateway_integration_response" "getTranslation" {
  http_method = "POST"
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  resource_id = aws_api_gateway_resource.getTranslation.id
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
  response_templates = {
    "application/json" = ""
  }
  status_code = "200"
}


resource "aws_api_gateway_deployment" "getTranslation" {
  depends_on  = [aws_api_gateway_integration.getTranslation]
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  stage_name  = "dev"
}

resource "aws_api_gateway_stage" "getTranslation" {
  stage_name    = "NProd"
  rest_api_id   = aws_api_gateway_rest_api.getTranslation.id
  deployment_id = aws_api_gateway_deployment.getTranslation.id
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.cloudlogs.arn
    format          = <<EOF
{ "requestId":"$context.requestId", "ip": "$context.identity.sourceIp", "caller":"$context.identity.caller", "user":"$context.identity.user","requestTime":"$context.requestTime", "httpMethod":"$context.httpMethod","resourcePath":"$context.resourcePath", "status":"$context.status","protocol":"$context.protocol", "responseLength":"$context.responseLength" }
EOF
  }
}

resource "aws_api_gateway_method_settings" "getTranslation" {
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  stage_name  = aws_api_gateway_stage.getTranslation.stage_name
  method_path = "${trimprefix(aws_api_gateway_resource.source.path, "/")}/${aws_api_gateway_method.post.http_method}"
  settings {
    metrics_enabled = true
    logging_level   = "INFO"
  }
}

resource "aws_api_gateway_method_settings" "getTranslation" {
  rest_api_id = aws_api_gateway_rest_api.getTranslation.id
  stage_name  = aws_api_gateway_stage.getTranslation.stage_name
  method_path = "${trimprefix(aws_api_gateway_resource.getTranslation.path, "/")}/${aws_api_gateway_method.getTranslation.http_method}"
  settings {
    metrics_enabled = true
    logging_level   = "INFO"
  }
}


resource "aws_api_gateway_account" "act" {
  cloudwatch_role_arn = aws_iam_role.cloudwatch.arn
}

resource "aws_cloudwatch_log_group" "cloudlogs" {
  name = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.getTranslation.id}/prod"
}

resource "aws_iam_role" "cloudwatch" {
  name               = "${var.project}-${var.environment}-getTranslation-apigateway-cloudwatch"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch" {
  name = "${var.project}-${var.environment}-getTranslation-apigateway-cloudwatch-policy"
  role = aws_iam_role.cloudwatch.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}