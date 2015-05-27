require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  before do
    admin = create :user, :admin
    sign_in admin
  end


  create_params 'location_params', {
      name: 'Location 1',
      address: 'Address 1',
      service_title: 'Service title',
      service_description: 'Service description',
      mentor_title: 'Mentor title',
      mentor_description: 'Mentor description',
      company_title: 'Company title',
      company_description: 'Company description',
      map_title: 'Map title',
      map_description: 'Map description',
      map_embed: 'Map embed',
      image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg')))
  }

  describe "GET #new" do
    it "a success" do
      get :new
      expect(response).to be_success
    end

    it "have @location" do
      get :new
      expect(assigns(:location)).to be_a(Location)
      expect(assigns(:location)).to be_new_record
    end
  end

  describe "POST #create" do

    it "create new location" do
      expect{
        post :create, location: location_params
      }.to change(Location, :count).by 1
    end

    it "create new location with correct attributes" do
      post :create, location: location_params
      location_params.except(:image).each do |key, value|
        expect(Location.last.try(key)).to eql value
      end

    end

    it "have correct flash.notice" do
      post :create, location: location_params
      expect(flash[:notice]).to eql 'Successfully created location.'
    end

    it "redirect to location page" do
      post :create, location: location_params
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |name|
      it "not create new location if name is empty" do
        expect {
          post :create, location: { name: name }
        }.to change(Location, :count).by 0
      end
    end

    [nil, ''].each do |name|
      it "have correct flash.notice if name is empty" do
        post :create, location: { name: name }
        expect(flash.now[:error]).to eql 'Fail to create location.'
      end
    end
  end

  describe "GET #edit" do
    it "a success" do
      @location = create :location
      get :edit, id: @location
      expect(response).to be_success
    end
  end

  describe "POST #update" do
    before do
      @location = create :location
    end

    it "have flash.notice" do
      patch :update, id: @location, location: { name: 'Location 2', image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(flash[:notice]).to eql 'Successfully updated location.'
    end

    it "redirect to edit page" do
      patch :update, id: @location, location: { name: 'Location 2', image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg'))) }
      expect(response).to redirect_to dashboard_path
    end

    [nil, ''].each do |name|
      it "have flash.notice if name is empty" do
        patch :update, id: @location, location: { name: name }
        expect(flash.now[:error]).to eql 'Fail to update location.'
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @location = create :location
    end

    it "delete the location" do
      expect{
        delete :destroy, id: @location
      }.to change(Location, :count).by -1
    end

    it "have correct flash.notice" do
      delete :destroy, id: @location
      expect(flash[:notice]).to eql 'Successfully deleted location.'
    end

    it "redirect to locations#index" do
      delete :destroy, id: @location
      expect(response).to redirect_to dashboard_path
    end
  end
end
