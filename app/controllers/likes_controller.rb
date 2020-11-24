class LikesController < ApplicationController
    skip_before_action :authorized


    def index
        likes= Like.all
        render json: {likes: likes}
    end

    def create
        like = Like.create(like_params)
        render json: {like: like}
    end

    def destroy
        like = Like.find(params[:id])

        like.destroy
        render json: {message: 'like destroyed'}
      end

    private
  
    def like_params
      params.permit(:user_id, :post_id)
    end

end
