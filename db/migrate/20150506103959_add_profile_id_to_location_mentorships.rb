class AddProfileIdToLocationMentorships < ActiveRecord::Migration
  def change
    add_column :location_mentorships, :profile_id, :integer
  end
end
