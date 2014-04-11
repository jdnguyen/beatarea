require 'spec_helper'

describe NotificationsController do
  describe 'create' do
    before do
      @event = create(:event, :start_time => 1.day.from_now)
    end

    context 'logged in' do
      before do
        @user = create(:user)
        session[:user_id] = @user.id
      end

      context 'succeed' do
        it 'should create a new notification' do
          expect{
            post :create, :event_id => @event.id
          }.to change{@event.reload.notifications.count}
          @event.notifications.last.user.should == @user
        end

        it 'should respond with a 200' do
          post :create, :event_id => @event.id
          response.response_code.should == 200
        end
      end

      context 'fail' do
        before do
          expect_any_instance_of(Event).to receive(:save).and_return(false)
        end

        it 'should not create a new notification' do
          expect{
            post :create, :event_id => @event.id
          }.not_to change{@event.reload.notifications.count}
        end

        it 'should respond with a 400' do
          post :create, :event_id => @event.id
          response.response_code.should == 400
        end
      end
    end

    context 'not logged in' do
      it 'should not create a new notification' do
        expect{
          post :create, :event_id => @event.id
        }.not_to change{@event.reload.notifications.count}
      end

      it 'should respond with a 400' do
        post :create, :event_id => @event.id
        response.response_code.should == 400
      end
    end
  end
end
