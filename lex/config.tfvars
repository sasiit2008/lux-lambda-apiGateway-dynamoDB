
indents = {
  indentone = {
    create_version = false
    name           = "indentone"
    description    = "Intent to order a bouquet of flowers for pick up"
    # fulfillment_activity
    type         = "ReturnIntent"
    # confirmation_prompt
    max_attempts = 2
    confirmation_prompt_content      = "Okay, your {FlowerType} will be ready for pickup by {PickupTime} on {PickupDate}.  Does this sound okay?"
    confirmation_prompt_content_type = "PlainText"
    # RejectionStatementContent
    rejection_statement_content      = "Okay, I will not place your order."
    rejection_statement_content_type = "PlainText"
    # sample_utterances changes here
    sample_utterances =  [
      "Help with Time integration",
      "time integration",
      "time integration help",
      "i need help in time integration",
      "time integration module",
      "changes are needed"
    ]
  },
  indenttwo = {
    create_version = false
    name           = "indenttwo"
    description    = "Intent to order a bouquet of flowers for pick up"
    # fulfillment_activity
    type         = "ReturnIntent"
    # confirmation_prompt
    max_attempts = 2
    confirmation_prompt_content      = "Okay, your {FlowerType} will be ready for pickup by {PickupTime} on {PickupDate}.  Does this sound okay?"
    confirmation_prompt_content_type = "PlainText"
    # RejectionStatementContent
    rejection_statement_content      = "Okay, I will not place your order."
    rejection_statement_content_type = "PlainText"
    sample_utterances = [
      "I would like to order some flowers",
      "I would like to pick up flowers",
      ]
  },
    indentthree = {
    create_version = false
    name           = "indentthree"
    description    = "Intent to order a bouquet of flowers for pick up"
    # fulfillment_activity
    type         = "ReturnIntent"
    # confirmation_prompt
    max_attempts = 2
    confirmation_prompt_content      = "Okay, your {FlowerType} will be ready for pickup by {PickupTime} on {PickupDate}.  Does this sound okay?"
    confirmation_prompt_content_type = "PlainText"
    # RejectionStatementContent
    rejection_statement_content      = "Okay, I will not place your order."
    rejection_statement_content_type = "PlainText"
    sample_utterances = [
      "I would like to order some flowers",
      "I would like to pick up flowers",
      ]
  },
    indentfour = {
    create_version = false
    name           = "indentfour"
    description    = "Intent to order a bouquet of flowers for pick up"
    # fulfillment_activity
    type         = "ReturnIntent"
    # confirmation_prompt
    max_attempts = 2
    confirmation_prompt_content      = "Okay, your {FlowerType} will be ready for pickup by {PickupTime} on {PickupDate}.  Does this sound okay?"
    confirmation_prompt_content_type = "PlainText"
    # RejectionStatementContent
    rejection_statement_content      = "Okay, I will not place your order."
    rejection_statement_content_type = "PlainText"
    sample_utterances = [
      "I would like to order some flowers",
      "I would like to pick up flowers",
      ]
  }
}


