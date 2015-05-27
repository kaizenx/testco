class RemoveLocationIdFromPricing < ActiveRecord::Migration
  def change
    remove_column :pricings, :location_id
  end
end
