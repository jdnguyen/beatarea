require 'spec_helper'

describe Event do
  describe 'fields' do
    it { should have_fields(:location_name, :location_address, :ticket_url, :stubhub_id) }
    it { should have_field(:start_time, :early_bird_time).of_type(DateTime)}
  end

  describe 'validations' do
    it { should validate_presence_of(:location_name) }
    it { should validate_presence_of(:location_address) }
    it { should validate_presence_of(:start_time) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:artists) }
    it { should embed_many(:notifications) }
  end

  describe 'scope' do
    before do
      @old_event = create(:event, :start_time => 10.days.ago)
      @future_event = create(:event, :start_time => 10.days.from_now)
      @today_event = create(:event, :start_time => 1.hour.from_now)
    end

    describe 'upcoming' do
      it 'should return upcoming events' do
        Event.upcoming.should =~ [@today_event, @future_event]
      end
    end

    describe 'sort_by_date' do
      it 'should return events by ascending starting dates' do
        Event.sort_by_date.should == [@old_event, @today_event, @future_event]
      end
    end
  end

  describe 'classes' do
    describe 'artists_names' do
      before do
        @dj_one = create(:artist, :name => 'Bob')
        @dj_two = create(:artist, :name => 'John')
        @event = create(:event, :artists => [@dj_one, @dj_two])
      end

      it 'should join the artists names' do
        @event.artists_names.should == 'Bob,John'
      end
    end

    describe 'event_title' do
      before do
        @dj_one = create(:artist, :name => 'Bob')
        @dj_two = create(:artist, :name => 'John')
        @event = create(:event, :artists => [@dj_one, @dj_two])
      end

      context 'event_name is nil' do
        it 'should return the artists names' do
          @event.event_title.should == 'Bob,John'
        end
      end

      context 'event_name has value' do
        before do
          @event.update_attribute(:event_name, 'Ultra')
        end

        it 'should return the artists names' do
          @event.event_title.should == 'Ultra'
        end
      end
    end
  end
end