class FriendshipsController < ApplicationController
    skip_before_action :authorized

   def index
    friendships= Friendship.all
    render json: {friendships: friendships}
    end


    def create
        friendship = Friendship.create(friendship_params)
        render json: {friendship: friendship}
    end

    def destroy
        friendship = Friendship.find(params[:id])

        friendship.destroy
        render json: {message: 'friendship destroyed'}
      end

    private
  
    def friendship_params
      params.permit(:follower_id, :followed_id)
    end
    
end
