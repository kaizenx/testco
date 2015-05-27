require 'rails_helper'

RSpec.describe ServicesController, :type => :controller do
  let(:location) { create :location }

  create_params 'service_params', {
      title: 'Service Title',
      description: 'Service description',
      image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg')))
  }

  describe "#new" do
    it "a success" do
      get :new, location_id: location.id
      expect(response).to be_success
    end

    it "have @service" do
      get :new, location_id: location.id
      expect(assigns(:service)).to be_a(Service)
      expect(assigns(:service)).to be_new_record
    end
  end

  describe "#create" do
    it "increase services count" do
      expect{
        post :create, location_id: location.id, service: service_params
      }.to change(Service, :count).by 1
    end

    it "created correct services" do
      post :create, location_id: location.id, service: service_params
      service_params.except(:image).each do |key, value|
        expect(Service.last.try(key)).to eq value
      end
    end
  end
end
