class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location_name
  field :location_address
  field :start_time, :type => DateTime
  field :ticket_url
  field :early_bird_time, :type => DateTime
  field :stubhub_id

  has_and_belongs_to_many :artists

  validates_presence_of :location_name, :location_address, :start_time

  scope :upcoming, -> { where(:start_time.gt => Time.now) }
  scope :sort_by_date, -> { order_by(:start_time => :asc) }

  def artists_names
    self.artists.map(&:name).join(',')
  end
end