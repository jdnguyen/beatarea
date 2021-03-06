class Genre
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_presence_of :name
  validates_uniqueness_of :name
end