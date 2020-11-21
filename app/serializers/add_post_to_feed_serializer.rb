class AddPostToFeedSerializer < ActiveModel::Serializer
  attributes :id, 
  has_many :posts
end
