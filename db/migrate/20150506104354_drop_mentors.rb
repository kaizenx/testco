class DropMentors < ActiveRecord::Migration
  def change
    drop_table :mentors
  end
end
