require 'spec_helper'

describe Artist do
  describe 'fields' do
    it { should have_fields(:name, :soundcloud_id, :website, :facebook_page, :twitter_page) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:genres) }
  end

  describe 'scope' do

  end
end