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
 
        post = Post.create(post_params)
        byebug
        feed_id = post.user.feed.id 
        byebug
        AddPostToFeed.create(post_id: post.id, feed_id: feed_id)
        render json: post 
        # byebug
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
