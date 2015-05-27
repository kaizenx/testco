require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  before do
    admin = create :user, :admin
    sign_in admin
    @location = create :location
  end

  describe "GET #new" do
    it "a success" do
      get :new
      expect(response).to be_success
    end

    it "have @event" do
      get :new
      expect(assigns(:event)).to be_a(Event)
      expect(assigns(:event)).to be_new_record
    end
  end

  describe "POST #create" do
    it "create new event" do
      expect{
        post :create, event: { title: 'Event 1', location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      }.to change(Event, :count).by 1
    end

    it "have correct flash.notice" do
      post :create, event: { title: 'Event 1', location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(flash[:notice]).to eql 'Successfully created event.'
    end

    it "redirect to event page" do
      post :create, event: { title: 'Event 1', location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |title|
      it "not create new event if title is empty" do
        expect {
          post :create, event: { title: title, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
        }.to change(Event, :count).by 0
      end
    end

    [nil, ''].each do |date|
      it "not create new event if date is empty" do
        expect {
          post :create, event: { title: 'title', date: date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
        }.to change(Event, :count).by 0
      end
    end

    [nil, ''].each do |empty|
      it "have correct flash.notice if name is empty" do
        post :create, event: { title: empty, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
        expect(flash.now[:error]).to eql 'Fail to create event.'
      end
    end
  end

  describe "GET #edit" do
    it "a success" do
      @event = create :event
      get :edit, id: @event
      expect(response).to be_success
    end
  end

  describe "PATCH #update" do
    before do
      @event = create :event
    end

    it "have flash.notice" do
      patch :update, id: @event, event: { title: 'Event 1', location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(flash[:notice]).to eql 'Successfully updated event.'
    end

    it "redirect to edit page" do
      patch :update, id: @event, event: { title: 'Event 1', location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |title|
      it "have flash.notice if name is empty" do
        patch :update, id: @event, event: { title: title, location_id: @location.id, date: Time.now.to_date, image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
        expect(flash.now[:error]).to eql 'Fail to update event.'
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @event = create :event
    end

    it "delete the event" do
      expect{
        delete :destroy, id: @event
      }.to change(Event, :count).by -1
    end

    it "have correct flash.notice" do
      delete :destroy, id: @event
      expect(flash[:notice]).to eql 'Successfully deleted event.'
    end

    it "redirect to events#index" do
      delete :destroy, id: @event
      expect(response).to redirect_to dashboard_path
    end
  end

end
