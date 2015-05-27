class AssignedRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :profile

  validates :role, presence: true
  validates :profile, presence: true

end
