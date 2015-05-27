require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:admin) { create :user, :admin }
  let(:user) { build :user }
  before do
    sign_in admin
  end

  describe "GET #new" do

    it "a success" do
      get :new
      expect(response).to be_success
    end

    it "have @user" do
      get :new
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_new_record
    end
  end

  describe "POST #create" do
    it "create new user" do
      expect{
        post :create, user: { email: user.email, password: user.password, password_confirmation: user.password, role: user.role, location_id: create(:location).id }
      }.to change(User, :count).by 1
    end


    it "have correct attributes" do
      {email: user.email, password: user.password, role: user.role}.each do |key, value|
        post :create, user: { email: user.email, password: user.password, password_confirmation: user.password, role: user.role, location_id: create(:location).id }
        expect(user.send(key)).to eql value
      end
    end

    it "have correct flash.notice" do
      post :create, user: { email: user.email, password: user.password, password_confirmation: user.password, role: user.role, location_id: create(:location).id }
      expect(flash[:notice]).to eql 'Successfully created user.'
    end

    it "redirect to user page" do
      post :create, user: { email: user.email, password: user.password, password_confirmation: user.password, role: user.role, location_id: create(:location).id }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |email|
      it "not create new user if email is empty" do
        expect {
          post :create, user: { email: email, password: user.password, password_confirmation: user.password }
        }.to change(User, :count).by 0
      end
    end

    [nil, ''].each do |email|
      it "have flash.error if email is empty" do
        post :create, user: { email: email, password: user.password, password_confirmation: user.password }
        expect(flash.now[:error]).to eql 'Fail to create user.'
      end
    end

    [nil, ''].each do |password|
      it "not create new user if password is empty" do
        expect {
          post :create, user: { email: user.email, password: password, password_confirmation: user.password }
        }.to change(User, :count).by 0
      end
    end

    [nil, ''].each do |password|
      it "have flash.notice #{I18n.t 'user.create.failure'} if email is empty" do
        post :create, user: { email: user.email, password: password, password_confirmation: user.password }
        expect(flash.now[:error]).to eql 'Fail to create user.'
      end
    end
  end

  describe "GET #edit" do
    before do
      @user = create :user
    end
    it "a success" do
      get :edit, id: @user
      expect(response).to be_success
    end

    it "have @user" do
      get :edit, id: @user
      expect(assigns(:user)).to eql @user
    end
  end

  describe "POST #update" do
    before do
      @user = create :user
    end

    it "have correct flash.notice" do
      patch :update, id: @user, user: { email: 'new@email.com', password: 'new_password', password_confirmation: 'new_password', location_id: create(:location).id }
      expect(flash[:notice]).to eql 'Successfully updated user.'
    end

    it "redirect to user page" do
      patch :update, id: @user, user: { email: 'new@email.com', password: 'new_password', password_confirmation: 'new_password', location_id: create(:location).id }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |empty|
      it "have flash.error if email is empty" do
        patch :update, id: @user, user: { email: empty, password: 'new_password', password_confirmation: 'new_password', location_id: create(:location).id }
        expect(flash.now[:error]).to eql 'Fail to update user.'
      end

      it "have flash.error if password is empty" do
        patch :update, id: @user, user: { email: 'new@email.com', password: empty, password_confirmation: 'new_password', location_id: create(:location).id }
        expect(flash.now[:error]).to eql 'Fail to update user.'
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = create :user
    end

    it "deletes user" do
      expect{
        delete :destroy, id: @user
      }.to change(User, :count).by -1
    end

    it "have correct flash.notice" do
      delete :destroy, id: @user
      expect(flash[:notice]).to eql 'Successfully deleted user.'
    end

    it "redirect to dashboard page" do
      delete :destroy, id: @user
      expect(response).to redirect_to dashboard_path
    end
  end
end
