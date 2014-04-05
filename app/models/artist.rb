class Artist
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :genre
end