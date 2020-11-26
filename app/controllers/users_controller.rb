class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # SHOW USERS
    def index
        users = User.all
        # friendships = Friendship.all
        # response = users, include: [:followers]
        render json: users, include: [:followers, :followees]
    end
    # render json: posts, include: [:likes]

        # include: [:followers, :followed]
        # render json: posts, include: [:likes]

    #SHOW USER
    def show
        user = User.find(params[:id])
        friendships = user.followers + user.followees
        render json: {user: user, friendships: friendships}
    end
    # render json: {post: post, likes: post.likes}

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id,  password: params[:password]})
        render json: {user: @user, token: token}
      else
        render json: {error: @user.errors.messages}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id, password: params[:password]})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    # EDIT USER
    def update
        @user = User.find(params[:id])
        @user.update(edit_params)
        if @user.valid?
            @token = encode_token({user_id: @user.id, password: params[:password]})
            render json: { user: @user, token: @token}
        else
            render json: { error: 'failed to edit user' }, status: :not_acceptable
        end
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :age, :firstName, :lastNameInitial)
    end

    def edit_params
        params.permit(:age, :firstName, :lastNameInitial, :location)
    end
  
end
