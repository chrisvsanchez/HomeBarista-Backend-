class UsersController < ApplicationController
    # skip_before_action :authenticate, only: [:login]
   
    def index 
        users = User.all
        render json: users
    end

    def show 
   
        user = User.find(params[:id])
  
        render json: user
    end

    def create 
        byebug
        user = User.create(
         email: params[:email],
         name: params[:name],
         bio: params[:bio],
         password: params[:password],
         current_coffee_beans: params[:currentCoffeeBeans],
         coffee_medium: params[:coffeeMedium], profile_img: Faker::Avatar.image,
        )
        Feed.create(user_id: user.id)
        byebug
            if user.valid?
                token = JWT.encode({user_id: user.id}, "so_secret", 'HS256')
        
                render json: {user: UserSerializer.new(user), token:token}, status: :created
            else
                render json: {error: user.error.full_messages},status: :bad_request 
            end
    end

    def login 
       usery = User.find_by(email: params[:email])
       if usery && usery.authenticate(params[:password])
        token = JWT.encode({user_id: usery.id}, "so_secret", 'HS256')
        
        
            render json: {user: UserSerializer.new(usery), token:token}
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized 
        end
    end

    def autologin
    
        # extract auth header
        auth_header = request.headers['Authorization']
        # get the token from the headers
        token = auth_header.split(' ')[1]
        #decode token using JWT library
        decoded_token = JWT.decode(token, 
        "so_secret", true, {algorthim: 'HS256'})
        #get user id from the decoded token 
        user_id = decoded_token[0]["user_id"]
        loggedInUser = User.find_by(id: user_id)
            if loggedInUser
                render json: loggedInUser
                # byebug
            else 
                render json: {message: "Not logged in"}, status: :unauthorized
            end
    end

    def update 
        byebug
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end
    def profile_picture
        auth_header = request.headers['Authorization']
        # get the token from the headers
        token = auth_header.split(' ')[1]
        #decode token using JWT library
        decoded_token = JWT.decode(token, 
        "so_secret", true, {algorthim: 'HS256'})
        #get user id from the decoded token 
        user_id = decoded_token[0]["user_id"]
     
        user =User.find_by(id: user_id)
  

        user.update(profile_img: params["photo"])
        render json: user
    end
    private 

    def user_params 
        params.permit(:name, :email, :password, :address)
    end
  
end
