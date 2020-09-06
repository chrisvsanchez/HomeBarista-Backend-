class AddPostToFeed < ApplicationRecord
  belongs_to :post
  belongs_to :feed
end
