module ApplicationHelper
  def rle(message, title="")
    Rails.logger.error("-"*10 + " " + title + " " + "-"*60)
    Rails.logger.error(message)
    Rails.logger.error("-"*75)
  end

  def json_for_events(events)
    Jbuilder.encode do |json|
      json.array!(events) do |event|
        json.id event.id.to_s
        json.location_name event.location_name
        json.start_time event.start_time.strftime('%-m/%-d/%y %l:%M%P')
        json.event_title event.event_title
        json.avatar event.event_image
      end
    end
  end

  def json_for_event(event)
    Jbuilder.encode do |json|
      json.ticket_url event.ticket_url
      json.location_address event.location_address
    end
  end
end
