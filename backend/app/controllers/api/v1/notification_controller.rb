class Api::V1::NotificationController < ApplicationController
  def create
    notification = Notification.find_by(web_hook_url: notification_params[:web_hook_url]) || Notification.create!(notification_params)
    render json: notification, serializer: NotificationSerializer
  end

  private

    def notification_params
      params.require(:notification).permit(:web_hook_url)
    end
end
