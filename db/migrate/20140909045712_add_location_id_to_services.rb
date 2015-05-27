class AddLocationIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :location_id, :integer
  end
end
