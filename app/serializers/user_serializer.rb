class UserSerializer < ActiveModel::Serializer
  # attributes :id, :bio, :name, :email, :password_digest, :current_coffee_beans, :coffee_medium, :profile_img
  
  # has_many :posts


  attributes :id, :bio, :name, :email, :password_digest, :current_coffee_beans, :coffee_medium, :profile_img
  
  has_many :posts
  has_many :reviews
  has_many :reviews, through: :posts
  has_one :feed 
end
