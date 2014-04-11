require 'spec_helper'

describe 'home page' do
  before do
    @event = create(:event)
    @artist = create(:artist)
    @event.artists << @artist
  end

  it 'should have the logo' do
    visit '/'
    expect(page).to have_content('BeatArea')
  end

  it 'should display the artist name for the event', :js => true do
    visit '/'
    expect(page).to have_content(@artist.name)
  end

  it 'should not display artist name but event name if there is one', :js => true do
    @event.update_attribute(:name, "Ultra")
    visit '/'
    expect(page).to have_content("Ultra")
    expect(page).not_to have_content(@artist.name)
  end
end