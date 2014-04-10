class Artist
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name
  field :soundcloud_id
  field :website
  field :facebook_page
  field :twitter_page
  field :soundcloud_songs

  has_and_belongs_to_many :genres

  validates_presence_of :name
  validates_uniqueness_of :name

  has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end