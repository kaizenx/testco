class CreateAvailableAreas < ActiveRecord::Migration
  def change
    create_table :available_areas do |t|
      t.integer "area_id",  null: false
      t.integer "location_id",  null: false
      t.timestamps null: false
    end
  end
end
