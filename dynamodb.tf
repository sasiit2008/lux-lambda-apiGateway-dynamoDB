# dynamodb.tf 

resource "aws_dynamodb_table" "chatbot" {
  name           = "${var.project}-chatbot-${var.environment}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  stream_enabled = false
  hash_key       = "S.No"
  attribute {
    name = "ItemMenu"
    type = "S"
  }
  attribute {
    name = "S.No"
    type = "N"
  }
  attribute {
    name = "SubModule"
    type = "S"
  }
  attribute {
    name = "Topic"
    type = "S"
  }

  global_secondary_index {
    hash_key = "ItemMenu"
    name     = "ItemMenu"
    non_key_attributes = [
      "SubModule",
    ]
    projection_type = "INCLUDE"
    read_capacity   = 5
    write_capacity  = 5
  }
  global_secondary_index {
    hash_key = "SubModule"
    name     = "SubModule"
    non_key_attributes = [
      "Alias",
    ]
    projection_type = "INCLUDE"
    read_capacity   = 5
    write_capacity  = 5
  }
  global_secondary_index {
    hash_key           = "Topic"
    name               = "Topic"
    non_key_attributes = []
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }

  point_in_time_recovery {
    enabled = false
  }

  timeouts {}

  ttl {
    enabled = false
  }

  tags = merge({ Name = "${var.project}-chatbot-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}


resource "aws_dynamodb_table" "menu" {
  name           = "${var.project}-chatbot-menu-${var.environment}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
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

  point_in_time_recovery {
    enabled = false
  }

  timeouts {}

  ttl {
    enabled = false
  }

  tags = merge({ Name = "${var.project}-chatbot-menu-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}



