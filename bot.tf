locals {
  bot_name = var.environment == "dev" ? "vwt_corp_chatbot_latis" : "vwt_corp_chatbot_latis${var.environment}"
}
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromLex"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.translate.function_name
  principal     = "lex.amazonaws.com"
  source_arn    = "arn:aws:lex:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:intent:${locals.bot_name}:*"
}




resource "aws_lex_bot" "vwt_corp_chatbot_latis_iat_one" {
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

  # intent {
  #   intent_name    = "LATIS_AP_Automatic_Payment"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_BatchInUse"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_BatchPosting"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_HELP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Invoice_Reversal"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Manual_Payment"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Match"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Payment"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Payment_Supplier"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_VoucherRedistribution"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_VoucherReversal"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Voucher_Approval_process"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AP_Voucher_Automatic_Payment"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_ChangeVatCode"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_Contract_Billing"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_HELP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_Invoice_Deletion"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_Invoice_Printout"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_Invoice_void"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AR_or_AP_not_Matching_GL"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_AddressBook_HELP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_All"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Batch_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Budget_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_CAFRecalculation_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_CAF_HELP"
  #   intent_version = "6"
  # }
  # intent {
  #   intent_name    = "LATIS_CafIssue_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_ChangeLanguage"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Create_Incident"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Currency"
  #   intent_version = "$LATEST"
  # }
  # # intent {
  # #   intent_name    = "LATIS_Customer_HELP"
  # #   intent_version = "$LATEST"
  # # }
  # # intent {
  # #   intent_name    = "LATIS_End_Greetings"
  # #   intent_version = "$LATEST"
  # # }

  # # intent {
  # #   intent_name    = "LATIS_GA_AccountPosting"
  # #   intent_version = "$LATEST"
  # # }
  # intent {
  #   intent_name    = "LATIS_FA_Creation"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_FA_Depreciation"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_FA_Fiscal"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_FA_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_FA_JournalEntry"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Finance"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Fixed_Assets"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_GA_BuCreate"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_GA_BuMaster"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_GL_Accounts"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_GeneralAccounting_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Inquiry_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Inventory_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Invoicing_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_JC_CAF"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_JC_Commitment"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_JC_Fiscal"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_JC_Scheduling"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_MD_AddressBook"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_MRP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_MRP_Help_Menu"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_MRP_SalesOrder"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Missing_Batch"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_NSP_PoApproval"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_NS_GL"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_NS_Purchase_Order_Rollout"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_POApproval_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_POEntry_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_POPRINT_HELP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PO_Creation"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PO_MatchingReceipt"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PR_PO"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoCreation_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoCreation_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoEntry_Rejection"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoInquiry_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoPrint_InitialLines"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoPrint_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoReceipt_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoReceipt_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_PoStatus_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Process_Purchase"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Process_Update"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Procurement_GL"
  #   intent_version = "$LATEST"

  # }
  # intent {
  #   intent_name    = "LATIS_Procurement_Purchase"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Procurement_PurchaseOrder_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_ProjectMaster_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Purchase_Order"
  #   intent_version = "$LATEST"

  # }
  # intent {
  #   intent_name    = "LATIS_Random_Identifier"
  #   intent_version = "$LATEST"

  # }
  # intent {
  #   intent_name    = "LATIS_Record_Invalid_message_in_various_programmes"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Reminder_Letter"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Response_No"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Response_Yes"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SD_NextStatus"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SD_OD"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SODOC_blank"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SODOC_print"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SO_Inquiry"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SO_Lots"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SO_Status_Update"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Sales"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SalesOrder_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SalesUpdate_Failure"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SalesUpdate_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_SalesUpdate_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Sales_AR_Invoice"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Sales_Order"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Sales_Order_loaction"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Sales_Update"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Scheduling_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_ShipConfirm_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Supplier_AP_Invoice"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TEServiceOrder_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TE_AfterApproval"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TE_BeforeApproval"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeAssignment_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeEntry_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeEntry_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeIntegration_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeSetup_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_TimeUpload_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry_Integreted"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry_TimeCalender"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry_TimeCard"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry_TimeWeek"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_Entry_Uploaded"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Time_InvalidPayStatus"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Unresolved"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VAT_report"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VM_Deactive"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VOM_PoUpdate"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VariationManagement_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Vendor"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VendorMaster_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Vendor_HELP"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Vendor_Hold"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_VoucherMatch_LiveCheck"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Websend_AR"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_Websend_Invoice"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_WorkbenchOrders_Help"
  #   intent_version = "$LATEST"
  # }
  # intent {
  #   intent_name    = "LATIS_greetingUser"
  #   intent_version = "$LATEST"
  # }
  intent {
    intent_name    = aws_lex_intent.LATIS_greetingUser.name
    intent_version = aws_lex_intent.LATIS_greetingUser.version
  }

  locale           = "en-US"
  name             = var.environment == "dev" ? "vwt_corp_chatbot_latis" : "vwt_corp_chatbot_latis${var.environment}"
  process_behavior = "SAVE"
  voice_id         = "Salli"
}
