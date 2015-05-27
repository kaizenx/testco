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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location_mentorship do
    mentor
    location
  end
end
