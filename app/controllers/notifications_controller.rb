class NotificationsController < ApplicationController
    skip_before_action :authorized


    def index
        notifications= Notification.all
        render json: {notifications: notifications}
    end

    def create
        notification = Notification.create(notification_params)
        render json: {notification: notification}
    end

    def destroy
        notification = Notification.find(params[:id])

        notification.destroy
        render json: {message: 'notification destroyed'}
      end

    private
  
    def notification_params
      params.permit(:user_id, :reason, :friend_id, :post_id)
    end
end
