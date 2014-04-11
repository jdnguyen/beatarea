module ApplicationHelper
  def rle(message, title="")
    Rails.logger.error("-"*10 + " " + title + " " + "-"*60)
    Rails.logger.error(message)
    Rails.logger.error("-"*75)
  end

  def json_for_errors(errors)
    Jbuilder.encode do |json|
      json.status "fail"
      json.error errors
    end
  end

  def json_for_events(events)
    Jbuilder.encode do |json|
      json.array!(events) do |event|
        json.id event.id.to_s
        json.location_name event.location_name
        json.ticket_url event.ticket_url
        json.location_address event.location_address
        json.start_time event.start_time.strftime('%-m/%-d/%y %l:%M%P')
        json.event_title event.event_title
        json.sold_out event.sold_out
        json.avatar event.event_image.url(:thumb)
      end
    end
  end

  def json_for_event(event)
    Jbuilder.encode do |json|
      json.id event.id.to_s
      json.location_name event.location_name
      json.ticket_url event.ticket_url
      json.location_address event.location_address
      json.start_time event.start_time.strftime('%-m/%-d/%y %l:%M%P')
      json.event_title event.event_title
      json.sold_out event.sold_out
      json.avatar event.event_image.url(:thumb)
      json.artists event.artists do |artist|
        json.name artist.name
        json.soundcloud_id artist.soundcloud_id
        json.facebook_page artist.facebook_page
        json.twitter_page artist.twitter_page
        json.soundcloud_songs artist.soundcloud_songs
      end
    end
  end
end
