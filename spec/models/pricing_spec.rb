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

require 'rails_helper'

RSpec.describe Pricing, :type => :model do
  let(:pricing) { build :pricing }

  subject { pricing }

  it { should respond_to :name }
  it { should respond_to :price }

end
