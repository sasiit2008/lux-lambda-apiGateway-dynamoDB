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
    "method.response.header.Access-Control-Allow-Origin" = false
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
  http_method = aws_api_gateway_method.getTranslation.http_method
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  resource_id = aws_api_gateway_resource.apiLambda.id
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
  response_templates = {
    "application/json" = ""
  }
  status_code = "200"
}

