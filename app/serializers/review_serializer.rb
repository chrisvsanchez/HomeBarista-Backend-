class ReviewSerializer < ActiveModel::Serializer
  attributes :id,  :post_id, :text
  belongs_to :user
  belongs_to :post
end
