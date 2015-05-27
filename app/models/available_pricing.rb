class AvailablePricing < ActiveRecord::Base
  belongs_to :pricing
  belongs_to :location

  validates :pricing, presence: true
  validates :location, presence: true
end
