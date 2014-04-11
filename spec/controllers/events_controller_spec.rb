require 'spec_helper'

describe EventsController do
  describe 'index' do
    before do
      @event_one = create(:event, :start_time => 1.day.from_now)
      @event_two = create(:event, :start_time => 1.day.ago)
      @event_three = create(:event)
      @event_one.reload
      @event_three.reload
      get :index
    end

    it 'should assign events' do
      assigns(:events).should =~ [@event_one, @event_three]
    end

    it 'should respond with json of all the events' do
      response.body.should == json_for_events([@event_one, @event_three])
    end
  end

  describe 'show' do
    before do
      @event = create(:event)
      @event.reload
      get :show, :id => @event.id
    end

    it 'should assign event' do
      assigns(:event).should == @event
    end

    it 'should respond with json of the event' do
      response.body.should == json_for_event(@event)
    end
  end
end