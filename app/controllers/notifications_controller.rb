class NotificationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    Notification.new(:user => current_user, :event => event)
    if event.save!
      render :json => "ok"
    else
      render :json => "fail", :status => 400
    end
  end
end
