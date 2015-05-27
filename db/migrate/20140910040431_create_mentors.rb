class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :name, null: false
      t.text :bio
      t.string :image

      t.timestamps
    end
  end
end
