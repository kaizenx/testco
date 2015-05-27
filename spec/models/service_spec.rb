# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  image       :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Service, :type => :model do
  let(:service) { build :service }

  subject { service }

  it { should respond_to :title }
  it { should respond_to :image }
  it { should respond_to :description }
  it { should respond_to :location }

  describe "location" do
    it "able to be assigned location" do
      location = create :location
      service.location = location
      expect(service.location).to eql location
    end
  end
end
