class Role < ActiveRecord::Base
  has_many :assigned_role
  validates :name, presence: true

  def name_enum
    ['Community', 'Partners', 'Team', 'Mentor']
  end 
end
