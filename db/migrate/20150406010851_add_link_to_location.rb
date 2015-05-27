class AddLinkToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :google_map_link, :string
  end
end
