# dynamodb.tf 

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.project}-${var.environment}-dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
  tags = merge({ Name = "${var.project}-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}