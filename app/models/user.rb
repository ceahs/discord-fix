class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true
    has_many :bot_methods
    has_many :polls
end
