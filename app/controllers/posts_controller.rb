class PostsController < ApplicationController
    skip_before_action :authorized


    def index
        posts = Post.all
        render json: posts, include: [:likes]
    end

    def show
        post = Post.find_by(id: params[:id])
        render json: {post: post, likes: post.likes}
    end

    def create
        post = Post.create(post_params)
        render json: {post: post}
    end

    private
  
    def post_params
      params.permit(:content, :user_id, :username)
    end

end
