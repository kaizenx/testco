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

class Service < ActiveRecord::Base
  has_many :available_services, dependent: :destroy
  mount_uploader :image, ImageUploader
end
