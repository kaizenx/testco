require 'rails_helper'

RSpec.describe NewsController, :type => :controller do

  let(:admin) { create :user, :admin }
  let(:news) { build :news }

  before do
    sign_in admin
  end

  describe "GET #new" do

    it "a success" do
      get :new
      expect(response).to be_success
    end

    it "have @news" do
      get :new
      expect(assigns(:news)).to be_a(News)
      expect(assigns(:news)).to be_new_record
    end
  end

  describe "POST #create" do
    it "create new news" do
      expect{
        post :create, news: { title: 'News 1', content: 'News 1 content.' }
      }.to change(News, :count).by 1
    end

    it "have correct flash.notice" do
      post :create, news: { title: 'News 1', content: 'News 1 content.' }
      expect(flash[:notice]).to eql 'Successfully created news.'
    end

    it "redirect to news page" do
      post :create, news: { title: 'News 1', content: 'News 1 content.' }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |title|
      it "not create new news if name is empty" do
        expect {
          post :create, news: { title: title }
        }.to change(News, :count).by 0
      end
    end

    [nil, ''].each do |content|
      it "have correct flash.notice if content is empty" do
        post :create, news: { content: content }
        expect(flash.now[:error]).to eql 'Fail to create news.'
      end
    end
  end

  describe "GET #edit" do
    it "a success" do
      @news = create :news
      get :edit, id: @news
      expect(response).to be_success
    end
  end

  describe "PATCH #update" do
    before do
      @news = create :news
    end

    it "have flash.notice" do
      patch :update, id: @news, news: { title: 'News 1', content: 'News 1 content.' }
      expect(flash[:notice]).to eql 'Successfully updated news.'
    end

    it "redirect to edit page" do
      patch :update, id: @news, news: { title: 'News 1', content: 'News 1 content.' }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |title|
      it "have flash.notice if title is empty" do
        patch :update, id: @news, news: { title: title, content: "News 1content" }
        expect(flash.now[:error]).to eql 'Fail to update news.'
      end
    end

    [nil, ''].each do |content|
      it "have flash.notice if content is empty" do
        patch :update, id: @news, news: { title: 'News 1', content: content }
        expect(flash.now[:error]).to eql 'Fail to update news.'
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @news = create :news
    end

    it "delete the news" do
      expect{
        delete :destroy, id: @news
      }.to change(News, :count).by -1
    end

    it "have correct flash.notice" do
      delete :destroy, id: @news
      expect(flash[:notice]).to eql 'Successfully deleted news.'
    end

    it "redirect to newss#index" do
      delete :destroy, id: @news
      expect(response).to redirect_to dashboard_path
    end
  end

end
