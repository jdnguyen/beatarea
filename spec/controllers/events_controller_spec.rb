require 'spec_helper'

describe NotificationsController do
  describe 'create' do
    before do
      @event = create(:event, :start_time => 1.day.from_now)
    end

    context 'good email' do
      it 'should create a new notification' do
        expect{
          post :create, :email => 'jdnguyenxo@gmail.com'
        }.to change(@event.reload.notifications.count)
        @event.notifications.last.email.should == 'jdnguyenxo@gmail.com'
      end

      it 'should respond with a 200' do
        post :create, :email => 'jdnguyenxo@gmail.com'
        response.response_code.should == 200
      end
    end

    context 'bad email' do
      it 'should not create a new notification' do
        expect{
          post :create, :email => 'jdnguyenxo'
        }.to_not change(@event.reload.notifications.count)
      end

      it 'should respond with a 400' do
        post :create, :email => 'jdnguyenxo'
        response.response_code.should == 400
      end
    end
  end
end