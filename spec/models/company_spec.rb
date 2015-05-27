# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  location_id :integer
#

require 'rails_helper'

RSpec.describe Company, :type => :model do
  let(:comapny) { build :company }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :image }

  it { should respond_to :location_id }
  it { should respond_to :location }
end
