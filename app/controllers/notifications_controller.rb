class NotificationsController < ApplicationController
  before_filter :authenticate_user
  before_filter :load_event

  def create
    notification = Notification.new(:user => current_user, :event => @event)
    if notification.save
      render :json => "ok"
    else
      render :json => json_for_errors(notification.errors), :status => 400
    end
  end

  def destroy
    notification = @event.notifications.where(:id => params[:id], :user_id => current_user.id).last
    if notification.destroy
      render :json => "ok"
    else
      render :json => json_for_errors(notification.errors), :status => 400
    end
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end
end
