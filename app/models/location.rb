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

class Location < ActiveRecord::Base
  has_many :users

  has_many :available_pricings
  has_many :pricings, through: :available_pricings

  has_many :location_mentorships
  has_many :profiles, through: :location_mentorships
  
  has_many :available_services
  has_many :services, through: :available_services
  
  has_many :companies, dependent: :destroy
  has_many :events, dependent: :destroy

  has_many :available_areas
  has_many :areas, through: :available_areas

  validates :name, :city, presence: true
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :city
  validates_associated :city

end
