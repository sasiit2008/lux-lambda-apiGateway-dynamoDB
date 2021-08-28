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
    http_method         = "POST"
    rest_api_id = aws_api_gateway_rest_api.getTranslation.id
    resource_id = aws_api_gateway_resource.getTranslation.id
    response_models     = {
        "application/json" = "Empty"
    }
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = false
    }
    status_code         = "200"
}


# resource "aws_api_gateway_integration" "get" {
#   rest_api_id             = aws_api_gateway_rest_api.apiLambda.id
#   resource_id             = aws_api_gateway_resource.apiLambda.id
#   http_method             = aws_api_gateway_method.get.http_method
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.get.invoke_arn
#   integration_http_method = "GET"
# }

# resource "aws_api_gateway_integration_response" "get" {
#   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
#   resource_id = aws_api_gateway_resource.apiLambda.id
#   http_method = aws_api_gateway_method.get.http_method
#   status_code = aws_api_gateway_method_response.get.status_code
# }
