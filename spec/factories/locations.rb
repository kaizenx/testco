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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence(:name) {|n| "Location name #{n}"}
    address 'address'
    description 'description'
    service_title 'service title'
    service_description 'service description'
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg')))
  end
end
