class AddLocationIdToArea < ActiveRecord::Migration
  def change
    add_column :areas, :location_id, :integer
  end
end
