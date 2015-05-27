class RemoveMentorIdColumn < ActiveRecord::Migration
  def change
    remove_column :location_mentorships, :mentor_id
  end
end
