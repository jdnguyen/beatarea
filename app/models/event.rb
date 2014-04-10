class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :event_name
  field :location_name
  field :location_address
  field :start_time, :type => DateTime
  field :ticket_url
  field :early_bird_time, :type => DateTime
  field :stubhub_id
  field :sold_out, :type => Boolean, :default => false

  has_and_belongs_to_many :artists
  #embeds_many :notifications

  has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :location_name, :location_address, :start_time

  scope :upcoming, -> { where(:start_time.gt => Time.now) }
  scope :sort_by_date, -> { order_by(:start_time => :asc) }

  def artists_names
    self.artists.map(&:name).join(', ')
  end

  def event_title
    self.event_name || artists_names
  end

  def event_image
    if self.avatar.exists?
      self.avatar
    else
      self.artists.first.avatar
    end
  end
end