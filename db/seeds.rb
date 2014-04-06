dubstep = Genre.create(:name => 'dubstep')
trance = Genre.create(:name => 'trance')
house = Genre.create(:name => 'house')
hardstyle = Genre.create(:name => 'hardstyle')

adventure_club = Artist.create(:name => 'Adventure Club', :genres => [dubstep], :soundcloud_id => 'adventureclub', :website => 'http://www.superheroesanonymoustour.com', :facebook_page => 'AdventureClub', :twitter_page => 'AdventureDub')
armin = Artist.create(:name => 'Armin', :genres => [house, trance], :soundcloud_id => 'arminvanbuuren', :website => 'www.arminvanbuuren.com', :facebook_page => 'arminvanbuuren', :twitter_page => 'arminvanbuuren')
krewella = Artist.create(:name => 'Krewella', :genres => [hardstyle, dubstep])
deadmau5 = Artist.create(:name => 'Deadmau5', :genres => [house])

Event.create(:location_name => 'Pacha', :location_address => '618 W 46th St, New York, NY 10036', :start_time => 1.year.from_now, :artists => [adventure_club])
Event.create(:location_name => 'Webster Hall', :location_address => '125 E 11th St, New York, NY 10003', :start_time => 1.month.from_now, :artists => [krewella])
Event.create(:location_name => 'Webster Hall', :location_address => '125 E 11th St, New York, NY 10003', :start_time => 5.month.from_now, :artists => [adventure_club])
Event.create(:location_name => 'Madison Square Garden', :location_address => '4 Pennsylvania Plaza, New York, NY 10001', :start_time => 5.month.from_now, :artists => [armin, deadmau5])