class PostSerializer < ActiveModel::Serializer
  attributes :id, :article_text, :title, :image, :user_id, :reviews

end
