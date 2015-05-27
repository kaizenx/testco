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
#

class Pricing < ActiveRecord::Base
  has_many :available_pricings, dependent: :destroy
  def currency_enum
    ['MYR', 'SGD']
  end

  def as_json
    {currency: self.currency, price: self.price.floor, name: self.name }
  end
end
