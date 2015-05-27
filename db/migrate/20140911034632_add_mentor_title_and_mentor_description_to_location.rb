class AddMentorTitleAndMentorDescriptionToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :mentor_title, :string
    add_column :locations, :mentor_description, :text
  end
end
