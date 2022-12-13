class PollsController < ActionController::Base
include Knock::Authenticable
before_action :authenticate_user, only: [:create, :results]
skip_before_action :verify_authenticity_token
require_relative 'bot/sendpoll.rb'

# Creates poll and sends poll link to discord channel
# Also creates view for poll to be sent to discord
# User clicks on the option they want to vote for and option is incremented



    def create
        @poll = current_user.polls.create(poll_params)
        if @poll.save
            render json:
                {message: "Poll created!",
                question1: :question1,
                question2: :question2,
                question3: :question3,
                question4: :question4 }, status: 200
                    polllink = polls_url(@poll)
                    current_user.discord_token = token
                    message = poll_params[:message]
                    channel = poll_params[:channel]
                    BotMethods.sendpoll(token, polllink, channel, message)
        else
            render json: {error: "Poll not created!"}, status: 404
        end
    end

# had issues with submitting poll results with my routes so I created
# an index and just sent to 404 and it fixed the issue


    def index
        raise ActionController::RoutingError.new('Not Found')
    end

    def show
        @poll = Poll.find(params[:id])
    end

    def submit1
        @poll = Poll.find(params[:poll_id])
        @poll.increment!(:result1)
        redirect_to poll_path(@poll)
    end

    def submit2
        @poll = Poll.find(params[:id])
        @poll.increment!(:result2)
        redirect_to poll_path(@poll)

    end

    def submit3
        @poll = Poll.find(params[:id])
        @poll.increment!(:result3)
        redirect_to poll_path(@poll)

    end

    def submit4
        @poll = Poll.find(params[:id])
        @poll.increment!(:result4)
        redirect_to poll_path(@poll)
    end

# compiles results from current user created polls
# to be made to look nice in React frontend

    def results
        @polls = Poll.where(user_id: current_user.id)
        render json: @polls
    end

    private 
    def poll_params
        params.permit(:title, :poll, :question1, :question2, :question3, :question4, :user_id, :channel, :message)
    end
end