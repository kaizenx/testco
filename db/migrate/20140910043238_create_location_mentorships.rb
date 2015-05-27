class CreateLocationMentorships < ActiveRecord::Migration
  def change
    create_table :location_mentorships do |t|
      t.integer :mentor_id
      t.integer :location_id

      t.timestamps
    end
  end
end
