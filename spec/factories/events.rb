# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  title             :string(255)      not null
#  date              :datetime         not null
#  created_at        :datetime
#  updated_at        :datetime
#  location_id       :integer          not null
#  image             :string(255)
#  description       :text
#  short_description :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    date "2014-08-06 15:53:52"
    location
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/image.jpg')))
  end
end
