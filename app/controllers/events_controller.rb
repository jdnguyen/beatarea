class EventsController < ApplicationController
  def index
    @events = Event.upcoming.sort_by_date
    render :json => json_for_events(@events)
  end

  def show
    @event = Event.find(params["id"])
    render :json => json_for_event(@event)
  end
end