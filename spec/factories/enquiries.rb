# == Schema Information
#
# Table name: enquiries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  company    :string(255)
#  phone      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#  types      :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enquiry do
    name "MyString"
    email "MyString"
    company "MyString"
    phone "MyString"
    types ""
    message "MyText"
  end
end
