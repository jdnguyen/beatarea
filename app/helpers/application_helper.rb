module ApplicationHelper
  def json_for_events(events)
    Jbuilder.encode do |json|
      json.array!(events) do |json, event|
        json.id event.id
        json.location_name event.location_name
        json.start_time event.start_time
        json.artists_names event.artists_names
      end
    end
  end

  def json_for_event(event)
    Jbuilder.encode do |json|
      json.id event.id
      json.name event.name
      json.location_name event.location_name
      json.start_time event.start_time
    end
  end
end
