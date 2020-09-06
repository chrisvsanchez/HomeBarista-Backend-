class User < ApplicationRecord
has_many :posts
has_many :reviews
has_many :addPostToFeed, through: :posts
has_one :feed 
end
