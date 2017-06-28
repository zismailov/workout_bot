require 'telegram/bot'
require './lib/app_configurator'

config = AppConfigurator.new

Telegram::Bot::Client.run(config.token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Hi, #{message.from.first_name}"
      )
    when '/stop'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Bye, #{message.from.first_name}"
      )
    end
  end
end
