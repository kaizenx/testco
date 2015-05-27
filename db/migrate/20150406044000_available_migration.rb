class AvailableMigration < ActiveRecord::Migration
  def change
    create_table :available_services do |t|
      t.integer  :service_id, null: false
      t.integer  :location_id, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
