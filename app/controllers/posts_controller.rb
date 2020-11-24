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
        if post.valid?
            render json: {post: post}
        else
            render json: {error: post.errors.messages}
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            render json: { post: @post}
        else
            render json: { error: 'failed to edit post' }, status: :not_acceptable
        end
    end


    private
  
    def post_params
      params.permit(:content, :user_id, :username)
    end

end
