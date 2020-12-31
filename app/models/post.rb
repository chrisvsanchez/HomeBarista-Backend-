class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :addPostToFeeds, dependent: :destroy
  # has_many :feeds, through: :addPostToFeeds
end
