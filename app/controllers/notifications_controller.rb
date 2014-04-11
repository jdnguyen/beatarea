class NotificationsController < ApplicationController
  def create
    if current_user
      event = Event.find(params[:event_id])
      Notification.new(:user => current_user, :event => event)
      if event.save
        render :json => "ok"
      else
        render :json => json_for_errors(event.errors), :status => 400
      end
    else
      render :json => json_for_errors("You are not logged in"), :status => 400
    end
  end
end
