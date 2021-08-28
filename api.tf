# # api.tf

resource "aws_api_gateway_rest_api" "getTranslation" {
    api_key_source               = "HEADER"
    description                  = "API to trigger lambda for translation"
    disable_execute_api_endpoint = false
    minimum_compression_size     = -1
    name                         = "getTranslation"
    tags = merge({ Name = "${var.project}-${var.environment}-getTranslation-apigateway" }, tomap(var.additional_tags))
    endpoint_configuration {
        types            = [
            "REGIONAL",
        ]
    }
}

# resource "aws_api_gateway_rest_api" "getTranslation" {
#   name = "getTranslation${var.environment}"
#   tags = merge({ Name = "${var.project}-${var.environment}-getTranslation-apigateway" }, tomap(var.additional_tags))
# }

resource "aws_api_gateway_resource" "getTranslation" {
    path        = "/"
    rest_api_id = aws_api_gateway_rest_api.getTranslation.id
}


# resource "aws_api_gateway_resource" "getTranslationRoot" {
#   rest_api_id = aws_api_gateway_rest_api.getTranslation.id
#   path_part   = "/"
# }

# resource "aws_api_gateway_resource" "getTranslation" {
#   rest_api_id = aws_api_gateway_rest_api.getTranslation.id
#   parent_id   = aws_api_gateway_rest_api.getTranslation.root_resource_id
#   path_part   = "/gettranslatetdtext"
# }

# resource "aws_api_gateway_method" "get" {
#   rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
#   resource_id   = aws_api_gateway_resource.apiLambda.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_method_response" "get" {
#   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
#   resource_id = aws_api_gateway_resource.apiLambda.id
#   http_method = aws_api_gateway_method.get.http_method
#   status_code = "200"
# }

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