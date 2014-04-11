class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email

  embedded_in :event
  belongs_to :user
end