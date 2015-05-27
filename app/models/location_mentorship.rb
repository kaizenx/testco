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

class LocationMentorship < ActiveRecord::Base
  belongs_to :profile
  belongs_to :location

  validates :profile_id, presence: true
  validates :location_id, presence: true
end
