class Api::V1::NotificationController < ApplicationController
  def create
    notification = Notification.create!(notification_params)
    render json: notification
  end

  private

    def notification_params
      params.require(:notification).permit(:web_hook_url)
    end
end
