class CommentsController < ApplicationController


    def index
        comments = Comment.all
        render json: comments, include: [:likes]
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: {comment: comment, likes: comment.likes}
    end

    def create
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: {comment: comment}
        else
            render json: {error: comment.errors.messages}
        end
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if @comment.valid?
            render json: { comment: @comment}
        else
            render json: { error: 'failed to edit comment' }, status: :not_acceptable
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.likes.destroy_all
        # plikes = Like.all.select {|l| l.comment_id == comment.id}
        # plikes.destroy_all
        comment.destroy
        render json: {message: 'comment destroyed'}
    end
end
