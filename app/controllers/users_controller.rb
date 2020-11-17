class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create, :login]
   
    def index 
        users = User.all
        render json: users
    end

    def show 
        user = User.find(params[:id])
        render json: user
    end

    def create 
        user = User.create(
         email: params[:email],
         name: params[:name],
         address: params[:address],
         password: params[:password]
        )
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
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    private 

    def user_params 
        params.permit(:name, :email)
    end
  
end
