# == Schema Information
#
# Table name: location_mentorships
#
#  id          :integer          not null, primary key
#  mentor_id   :integer
#  location_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe LocationMentorship, :type => :model do
  it { respond_to :mentor_id }
  it { respond_to :mentor }
  it { respond_to :location_id }
  it { respond_to :location }

  describe "Association" do
    it "belongs_to Mentor" do
      mentor = create :mentor
      l_m = create :location_mentorship, mentor: mentor
      expect(l_m.mentor).to eq mentor
    end

    it "belongs_to Location" do
      location = create :location
      l_m = create :location_mentorship, location: location
      expect(l_m.location).to eq location
    end

  end
end
