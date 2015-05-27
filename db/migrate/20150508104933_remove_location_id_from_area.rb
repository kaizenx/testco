class RemoveLocationIdFromArea < ActiveRecord::Migration
  def change
    remove_column :areas, :location_id
  end
end
