resource "aws_lex_bot_alias" "alias" {
  bot_name    = aws_lex_bot.tf.name
  bot_version = aws_lex_bot.tf.version
  description = "Development version of bot to make chatbot"
  name = "orderflowers"
}



# data "aws_lex_bot" "tf" {
#   name    = aws_lex_bot.tf.name
#   version = aws_lex_bot.tf.version
# }

# data "aws_lex_bot_alias" "tf" {
#   bot_name = aws_lex_bot_alias.alias.bot_name
#   name     = aws_lex_bot_alias.alias.name
# }

# data "aws_lex_intent" "tf" {
#   name    = aws_lex_intent.indent.name
#   version = aws_lex_intent.indent.version
# }