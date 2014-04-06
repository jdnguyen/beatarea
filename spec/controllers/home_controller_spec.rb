require 'spec_helper'

describe HomeController do
  describe 'index' do
    before do
      get :index
    end

    it 'should renders the index template' do
      expect(response).to render_template('index')
    end
  end
end