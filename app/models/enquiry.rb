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

class Enquiry < ActiveRecord::Base
  
end
