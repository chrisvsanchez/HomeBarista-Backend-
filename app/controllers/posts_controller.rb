class PostsController < ApplicationController

    def index 
        posts = Post.all 
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        # byebug
        card = Post.create(post_params)
          render json: card 
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy  
        render json: {}
    end
    private
    def post_params
        params.permit(:article_text, :title, :image, :reviews, :post, :user_id )
    end
end
