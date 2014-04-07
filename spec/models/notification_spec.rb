require 'spec_helper'

describe Notification do
  describe 'fields' do
    it { should have_fields(:email) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:event) }
  end
end