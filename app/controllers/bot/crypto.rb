require 'discordrb'
require 'json'
require 'rest-client'

# recieve data from bot_methods controller
# create a rest client with a json link to current BTC prices
# get content from json and return it to hash
# sort to the data I want then return it to discord

class BotMethods
    def self.cryptoprice(channel, token)
        @bot = Discordrb::Bot.new token: token
        response = RestClient.get("https://api.coindesk.com/v1/bpi/currentprice.json")
        message = JSON.parse(response).to_hash
        price = message["bpi"]["USD"]["rate"]
        @bot.send_message(channel, "The current price of Bitcoin is: USD$#{price}!")
    end
end