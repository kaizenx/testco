require 'rails_helper'

RSpec.describe EnquiriesController, :type => :controller do
  create_params 'enquiry_params', {
    name: 'Enquirer 1',
    email: 'email@email.com',
    company: 'Enquirer Company',
    phone: 'Enquirer Phone',
    types: 'Enquiry type',
    message: 'Enquiry message'
  }

  describe "#create" do
    before do
      request.env["HTTP_REFERER"] = root_path
    end
    it "should increase number of enquiry" do
      expect{
        post :create, enquiry: enquiry_params
      }.to change(Enquiry, :count).by 1
    end

    it "should have the right attributes" do
      post :create, enquiry: enquiry_params
      enquiry_params.each do |key, value|
        expect(Enquiry.last.try(key)).to eql value
      end
    end
  end
end
