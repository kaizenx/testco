class Profile < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :assigned_roles
  has_many :roles, through: :assigned_roles
  has_many :location_mentorships
  
  def self.all_community
    self.joins(:roles).where("roles.name = ?", "Community")
  end
  
  def self.all_partners
    self.joins(:roles).where("roles.name = ?", "Partners")
  end

  def self.all_team
    self.joins(:roles).where("roles.name = ?", "Team")
  end

  def self.all_mentors
    self.joins(:roles).where("roles.name = ?", "Mentor")
  end
end
