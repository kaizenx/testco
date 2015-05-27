# == Schema Information
#
# Table name: available_services
#
#  id          :integer          not null, primary key
#  service_id  :integer          not null
#  location_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class AvailableService < ActiveRecord::Base
  belongs_to :service
  belongs_to :location

  validates :service, presence: true
  validates :location, presence: true

  def name
    self.id
    if self.service
      self.service.title
    end
  end
end
