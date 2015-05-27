require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do
  let(:location) { create :location }

  create_params 'company_params', {
    name: 'Company name',
    description: 'Company description',
    image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg')))
  }

  describe "#new" do
    before do
      get :new, location_id: location.id
    end

    it "a success" do
      expect(response).to be_success
    end

    it "has correct variables" do
      expect(assigns(:location)).to eql location
      expect(assigns(:company)).to be_a Company
      expect(assigns(:company)).to be_a_new_record
    end
  end

  describe "#create" do
    it "increase company count" do
      expect{
        post :create, location_id: location.id, company: company_params
      }.to change(Company, :count).by 1
    end

    it "creates correct company" do
      post :create, location_id: location.id, company: company_params
      company_params.except(:image).each do |key,value|
        expect(Company.last.try(key)).to eql value
      end
    end
  end
end
