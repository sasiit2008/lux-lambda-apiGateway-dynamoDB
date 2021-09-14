resource "aws_lex_bot" "tf" {
  abort_statement {
    message {
      content_type = "PlainText"
      content      = "Sorry, I could not understand. Please type 'Help'"
    }
  }

  child_directed = false

  clarification_prompt {
    max_attempts = 2

    message {
      content_type = "PlainText"
      content      = "Sorry, what can I help you with?"
    }
  }

  description                 = "Bot to chat"
  detect_sentiment            = false
  idle_session_ttl_in_seconds = 600

  dynamic "intent" {
    iterator = intent
    for_each = aws_lex_intent.indents
    content {
      intent_name    = intent.value.name
      intent_version = intent.value.version
    }
  }

  locale           = "en-US"
  name             = "orderflowers"
  process_behavior = "SAVE"
  voice_id         = "Salli"
}

