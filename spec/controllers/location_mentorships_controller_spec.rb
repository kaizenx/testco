require 'rails_helper'

RSpec.describe LocationMentorshipsController, :type => :controller do
  let(:location) { create :location }

  create_params 'location_mentorship_params', {
    mentor_id: 1
  }

  describe "#new" do
    it "a success" do
      get :new, location_id: location.id
      expect(response).to be_success
    end

    it "have correct variable" do
      get :new, location_id: location.id
      expect(assigns(:mentorship)).to be_a LocationMentorship
      expect(assigns(:mentorship)).to be_new_record
    end
  end

  describe "#create" do
    it "increase location_mentorships count" do
      expect{
        post :create, location_id: location.id, location_mentorship: location_mentorship_params
      }.to change(LocationMentorship, :count).by 1
    end

    it "created correct location_mentorships" do
      post :create, location_id: location.id, location_mentorship: location_mentorship_params
      location_mentorship_params.except(:image).each do |key, value|
        expect(LocationMentorship.last.try(key)).to eq value
      end
    end
  end
end
