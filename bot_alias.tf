resource "aws_lex_bot_alias" "LATIS_greetingUser_dev" {
  bot_name    = aws_lex_bot.vwt_corp_chatbot_latis_iat_one.name
  bot_version = aws_lex_bot.vwt_corp_chatbot_latis_iat_one.version
  description = "Development version of bot to make chatbot"
  name        = "LATIS_greetingUser_dev"
}