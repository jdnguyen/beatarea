class Artist
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :genre
  field :soundcloud_id
  field :website
  field :facebook_page
  field :twitter_page

  validate :name, :genre

  def genre_enum
    ['ambient', 'drum & bass', 'dubstep', 'electro', 'hardstyle', 'house', 'techno', 'trance', 'trap']
  end
end