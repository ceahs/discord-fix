require 'discordrb'
require 'json'

class BotMethods
    def self.sendmessage(bot_token, message, channel)
        bot = Discordrb::Bot.new token: bot_token
        bot.send_message(channel, message)
    end
end