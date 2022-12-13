class UsersController < ApplicationController
before_action :authenticate_user, only: [:message]
require_relative 'bot/bot.rb'
include Bot


# Authentication made for single page. If no token exists create account for it

    def create 
        @user = User.find_by_discord_token(params[:discord_token])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {id: @user.id, jwt: auth_token.token, message: "Successfully signed in!"}, status: 200
        else
            @user = User.create(user_params)
            if @user.save
                auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                render json: {id: @user.id, jwt: auth_token.token, message: "Successfully signed up!"}, status: 200
            else
                render json: {error: "Failed to sign up."}, status: 401
            end
        end 
    end 

    
# Makes sure params arent empty, gets the token from currently authenticated user to send message through bot

    def message
        if current_user.discord_token != nil && sendmessage_params[:message] != nil && sendmessage_params[:channel] != nil
            bot_token = current_user.discord_token
            message = sendmessage_params[:message]
            channel = sendmessage_params[:channel]
                BotMethods.messagechannel(bot_token, message, channel)
                render json: {message: "Message sent!"}, status: 200
        else
            render json: {error: "Invalid Token or Channel!"}, status: 404
        end
    end

    private 
    def user_params 
        params.permit(:password, :password_confirmation, :discord_token)
    end 

    def sendmessage_params
        params.permit(:message, :channel)
    end

     private 
    def poll_params
        params.require(:poll).permit(:title, :question1, :question2, :question3, :question4)
    end
end
