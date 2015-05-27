# == Schema Information
#
# Table name: locations
#
#  id                  :integer          not null, primary key
#  name                :string(255)      not null
#  created_at          :datetime
#  updated_at          :datetime
#  image               :string(255)
#  address             :text
#  description         :text
#  service_title       :string(255)      default("Our services")
#  service_description :text
#  mentor_title        :string(255)      default("Mentorship")
#  mentor_description  :text
#  company_title       :string(255)      default("Our companies")
#  company_description :text
#  map_title           :string(255)      default("Finding us")
#  map_description     :text
#  map_embed           :text
#  latitude            :float
#  longitude           :float
#  google_map_link     :string(255)
#  city_id             :integer
#

require 'rails_helper'

RSpec.describe Location, :type => :model do
  let(:location) { build :location }

  subject { location }

  it { should respond_to :name }
  it { should respond_to :users }
  it { should respond_to :image }
  it { should respond_to :description }
  it { should respond_to :address }


  it { should respond_to :service_title }
  it { should respond_to :service_description }

  it { should respond_to :location_mentorships }

  it { should respond_to :mentor_title }
  it { should respond_to :mentor_description }

  it { should respond_to :company_title }
  it { should respond_to :company_description }

  it { should respond_to :map_title }
  it { should respond_to :map_description }
  it { should respond_to :map_embed }


  describe "users" do
    it "able to be assigned user" do
      user = create :user
      location.users << user
      expect(location.users.first).to eql user
    end

    it "able to be assigned service" do
      service = create :service
      location.services << service
      expect(location.services.first).to eql service
    end

    it "able to be assigned companies" do
      company = create :company
      location.companies << company
      expect(location.companies.first).to eql company
    end
  end
end
