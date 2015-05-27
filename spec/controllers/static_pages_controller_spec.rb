require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'landing'" do
    it "returns http success" do
      get 'landing'
      expect(response).to be_success
    end
  end
end
