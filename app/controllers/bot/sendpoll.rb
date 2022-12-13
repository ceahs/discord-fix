require 'discordrb'

class BotMethods
    def self.sendpoll(token, polllink, channel, message)
        bot = Discordrb::Bot.new token: token
        bot.send_message(channel, "#{message} \n\n #{polllink}")
    end
end