# == Schema Information
#
# Table name: pricings
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#  currency    :string(255)
#  period      :string(255)
#  public      :boolean
#  location_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pricing do
    name "MyString"
    price "9.99"
  end
end
