class FeedSerializer < ActiveModel::Serializer
  attributes :id, :posts, :user
end
