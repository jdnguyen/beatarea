require 'spec_helper'

describe Notification do
  describe 'fields' do
    it { should have_fields(:email) }
  end

  describe 'validations' do

  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should be_embedded_in(:event) }
  end
end