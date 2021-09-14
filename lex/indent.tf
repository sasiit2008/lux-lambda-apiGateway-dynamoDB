resource "aws_lex_intent" "indents" {
  for_each       = var.indents
  name           = each.key
  create_version = lookup(each.value, "create_version")
  description    = lookup(each.value, "description")
  fulfillment_activity {
    type = lookup(each.value, "type")
  }

  confirmation_prompt {
    max_attempts = lookup(each.value, "max_attempts")
    message {
      content      = lookup(each.value, "confirmation_prompt_content")
      content_type = lookup(each.value, "confirmation_prompt_content_type")
    }
  }

  rejection_statement {
    message {
      content      = lookup(each.value, "rejection_statement_content")
      content_type = lookup(each.value, "rejection_statement_content_type")
    }
  }
  sample_utterances = lookup(each.value, "sample_utterances")
}
