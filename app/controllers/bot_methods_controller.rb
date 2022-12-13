class BotMethodsController < ApplicationController
    before_action :authenticate_user, only: [:crypto]
    require_relative 'bot/crypto.rb'


    
# makes sure params exist and sends content to crypto.rb

    def crypto
        if current_user.discord_token != nil && crypto_params[:channel] != nil
            token = current_user.discord_token
            channel = crypto_params[:channel]
            BotMethods.cryptoprice(channel, token)
            render json: {message: "Message sent!"}, status: 200
        else
            render json: {error: "Invalid Token!"}, status: 404
        end
    end

    private
    def crypto_params
        params.permit(:channel, :bot_method)
    end
end
