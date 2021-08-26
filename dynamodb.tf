# dynamodb.tf 

resource "aws_dynamodb_table" "chatbot" {
  name           = "${var.project}-chatbot-${var.environment}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "S.No"
  attribute {
    name = "S.No"
    type = "N"
  }

  global_secondary_index {
    name               = "ItemMenu"
    hash_key           = "ItemMenu"
    projection_type    = "INCLUDE"
  }
  global_secondary_index {
    name               = "SubModule"
    hash_key           = "SubModule"
    projection_type    = "INCLUDE"
  }
    global_secondary_index {
    name               = "Topic"
    hash_key           = "Topic"
    projection_type    = "INCLUDE"
  }

  attribute {
    name = "ItemMenu"
    type = "S"
  }

  attribute {
    name = "SubModule"
    type = "S"
  }
  attribute {
    name = "Topic"
    type = "S"
  }

  tags = merge({ Name = "${var.project}-chatbot-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}


resource "aws_dynamodb_table" "menu" {
  name           = "${var.project}-chatbot-menu-${var.environment}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ItemMenu"
  range_key      = "LangCode"
  attribute {
    name = "ItemMenu"
    type = "S"
  }
  attribute {
    name = "LangCode"
    type = "S"
  }
  tags = merge({ Name = "${var.project}-chatbot-menu-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}


