class AvailableArea < ActiveRecord::Base
  belongs_to :area
  belongs_to :location

  validates :area, presence: true
  validates :location, presence: true

  def name
    self.id
    if self.area
      self.area.name
    end
  end
end
