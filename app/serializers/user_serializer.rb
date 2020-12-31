class UserSerializer < ActiveModel::Serializer

  attributes :id, :bio, :name, :email, :password_digest, :current_coffee_beans, :coffee_medium, :profile_img
  
  has_many :posts
  
end
