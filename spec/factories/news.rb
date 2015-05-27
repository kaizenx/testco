# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title "Title"
    content "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero totam quaerat ad, officiis, eius quis autem dolores. Assumenda expedita corporis possimus animi consequuntur laborum ad iure soluta, officia, eos ab."
  end
end
