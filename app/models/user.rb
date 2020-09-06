class User < ApplicationRecord
has_many :posts
has_many :reviews
has_many :addPostToFeed, through: :posts
has_many :reviews, through: :posts
has_one :feed 
validates :email, uniqueness: {case_sensitive: false}

end
