class FeedSerializer < ActiveModel::Serializer
  attributes :id, :user
  has_many :posts
end
