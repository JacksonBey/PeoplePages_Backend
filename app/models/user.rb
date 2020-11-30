class User < ApplicationRecord
    has_secure_password

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
    has_many :followers, through: :following_users
    has_many :notifications

    # has_many :posts
    # has_many :likes, through :posts


    validates :username, uniqueness: true
end
