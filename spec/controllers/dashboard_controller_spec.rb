require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  describe "GET 'index'" do

    context 'without signin' do
      it "will redirect to signin page" do
        get 'index'
        expect(response).to redirect_to sign_in_path
        expect(flash[:alert]).to eql 'You need to sign in or sign up before continuing.'
      end
    end

    context 'without admin signin' do
      before do
        user = create :user
        sign_in user
      end

      it "not be denied" do
        expect{
          get 'index'
        }.to raise_error(CanCan::AccessDenied)
      end
    end

    context 'with admin signin' do
      before do
        admin = create :user, :admin
        sign_in admin
      end

      it "not be denied" do
        get 'index'
        expect(response).to be_success
      end

      it "should have locations data" do
        get 'index'
        expect(assigns(:locations)).to eql Location.all.to_a
      end

      it "should have users data" do
        get 'index'
        expect(assigns(:users)).to eql User.all.to_a
      end
    end
  end
end
