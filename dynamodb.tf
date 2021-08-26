# dynamodb.tf 

resource "aws_dynamodb_table" "chatbot" {
  name           = "${var.project}-chatbot-${var.environment}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "S.No"
  attribute {
    name = "S.No"
    type = "S"
  }
  # attribute {
  #   name = "Alias"
  #   type = "S"
  # }

  # attribute {
  #   name = "Answer"
  #   type = "S"
  # }

  # attribute {
  #   name = "Model"
  #   type = "S"
  # }
  # attribute {
  #   name = "Google_Documents_Link"
  #   type = "S"
  # }
  # attribute {
  #   name = "ItemMenu"
  #   type = "S"
  # }
  # attribute {
  #   name = "ServiceNowCategory"
  #   type = "S"
  # }
  # attribute {
  #   name = "SubModule"
  #   type = "S"
  # }
  # attribute {
  #   name = "Topic"
  #   type = "S"
  # }
  # attribute {
  #   name = "Country"
  #   type = "S"
  # }
  # attribute {
  #   name = "Slot"
  #   type = "S"
  # }

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
local_secondary_index {
  name = "local_indexes"
  range_key = "LangCode"
  projection_type = "INCLUDE"
  non_key_attributes = ["SubModule", "Message"]
}

  tags = merge({ Name = "${var.project}-chatbot-menu-${var.environment}-dynamodb" }, tomap(var.additional_tags))
}


