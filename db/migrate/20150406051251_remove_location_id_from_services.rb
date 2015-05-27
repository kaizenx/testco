class RemoveLocationIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :location_id
  end
end
