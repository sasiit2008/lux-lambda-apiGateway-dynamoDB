resource "aws_lex_intent" "LATIS_greetingUser" {
  confirmation_prompt {
    max_attempts = 2

    message {
      content      = "Sorry, I could not understand. Please type Help"
      content_type = "PlainText"
    }

  }

  description = "Intent to book a car on StayBooker"

  fulfillment_activity {
    type = "ReturnIntent"
  }

  name = "LATISgreetingUser"

  rejection_statement {
    message {
      content      = "Okay, I have cancelled your reservation in progress."
      content_type = "PlainText"
    }
  }

  sample_utterances = [
    "what is your name",
    "how are you",
    "what's up",
    "Hey",
    "Hola",
    "Hello",
    "Hi",
  ]
  
}


