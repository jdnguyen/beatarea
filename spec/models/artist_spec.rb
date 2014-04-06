require 'spec_helper'

describe Artist do
  describe 'fields' do
    it { should have_fields(:name, :genre, :soundcloud_id, :website, :facebook_page, :twitter_page) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do

  end

  describe 'scope' do

  end
end