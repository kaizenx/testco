class AddMapTitleAndMapDescriptionToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :map_title, :string
    add_column :locations, :map_description, :text
  end
end
