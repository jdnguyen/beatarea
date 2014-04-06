class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location_name
  field :location_address
  field :time, :type => DateTime
  field :ticket_url
  field :early_bird_time, :type => DateTime
  field :stubhub_id

  has_many :artists

  validate :location_name, :location_address, :time
end