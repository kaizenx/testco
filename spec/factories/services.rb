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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    image ""
    title ""
    description "MyText"
  end
end
