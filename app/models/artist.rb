class Artist
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :soundcloud_id
  field :website
  field :facebook_page
  field :twitter_page

  has_and_belongs_to_many :genres

  validates_presence_of :name
  validates_uniqueness_of :name
end