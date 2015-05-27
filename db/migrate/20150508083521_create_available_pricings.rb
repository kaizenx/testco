class CreateAvailablePricings < ActiveRecord::Migration
  def change
    create_table :available_pricings do |t|
      t.integer :location_id, null: false
      t.integer :pricing_id, null: false
      t.timestamps null: false
    end
  end
end
