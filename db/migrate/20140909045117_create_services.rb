class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
