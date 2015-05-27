class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string "name"
      t.string "blurb"
      t.string "title"
      t.string "facebook"
      t.string "instagram"
      t.string "twitter"
      t.string "image"
      t.integer "community_id", null: false
      t.timestamps null: false
    end
  end
end
