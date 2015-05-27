# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string(255)      default("user"), not null
#  location_id            :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) {|n| "user#{n}#{Time.now.to_i}@example.com" }
    password 'password'
    role 'user'

    trait :admin do
      role 'admin'
    end

    trait :manager do
      role 'manager'
    end
  end
end