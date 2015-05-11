require 'spec_helper'

describe RawnetAdmin::UsersController, :type => :controller do
  describe '#index' do
    before do
      get :index, use_route: 'admin'
    end

    it 'assigns all users' do
      users = 10.times.collect{ FactoryGirl.create(:user) }
      subject.send(:collection)
      expect(assigns(:users).all).to be == users
    end
  end

end
