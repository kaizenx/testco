# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  location_id :integer
#

class Company < ActiveRecord::Base
  belongs_to :location
  mount_uploader :image, ImageUploader
end
