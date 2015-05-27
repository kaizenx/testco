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

require 'rails_helper'

RSpec.describe Enquiry, :type => :model do
  let(:enquiry) { build :enquiry }

  subject { enquiry }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :company }
  it { should respond_to :phone }
  it { should respond_to :types }
  it { should respond_to :message }
end
