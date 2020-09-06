class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :current_coffee_beans, :coffee_medium, :profile_img
  
  has_many :posts
  has_many :reviews
  has_many :reviews, through: :posts
  has_one :feed 
end
