require 'spec_helper'

describe Genre do
  describe 'fields' do
    it { should have_fields(:name) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end