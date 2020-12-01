class ReviewsController < ApplicationController


    def index
        reviews = Review.all
        render json: reviews
    end

    def create

        byebug
    end
end
