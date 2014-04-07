class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email

  belongs_to :event

  validates_presence_of :email
  validates_uniqueness_of :email

  validates :email, :email => true
end