class AddMapEmbedToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :map_embed, :text
  end
end
