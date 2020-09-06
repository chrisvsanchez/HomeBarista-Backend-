class Feed < ApplicationRecord
  belongs_to :user
  has_many :addPostToFeed
  has_many :posts, through: :addPostToFeed
end
