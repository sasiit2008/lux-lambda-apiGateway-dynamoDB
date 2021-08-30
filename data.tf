data "aws_lex_bot" "vwt_corp_chatbot_latis_iat_one" {
  //name    = "vwt_corp_chatbot_latis_iat"
  //version = "1"
  name    = aws_lex_bot.vwt_corp_chatbot_latis_iat_one.name
  version = aws_lex_bot.vwt_corp_chatbot_latis_iat_one.version
}

data "aws_lex_bot_alias" "LATIS_greetingUser_dev" {
  //bot_name = "vwt_corp_chatbot_latis_iat_one"
  //name     = "LATIS_greetingUser_dev"
  bot_name = aws_lex_bot_alias.LATIS_greetingUser_dev.bot_name
  name     = aws_lex_bot_alias.LATIS_greetingUser_dev.name
}

data "aws_lex_intent" "LATIS_greetingUser" {
  //name    = "vwt_corp_chatbot_latis_iat_one"
  //version = "$1"
  name    = aws_lex_intent.LATIS_greetingUser.name
  version = aws_lex_intent.LATIS_greetingUser.version
}