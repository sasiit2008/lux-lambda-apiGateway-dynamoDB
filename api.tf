# api.tf

resource "aws_api_gateway_rest_api" "apiLambda" {
  name = "get-${var.project}-${var.environment}-apigateway"
  tags = merge({ Name = "${var.project}-${var.environment}-apigateway" }, tomap(var.additional_tags))
}

resource "aws_api_gateway_resource" "apiLambda" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "base"
}
