class AddServiceTitleAndServiceDescriptionToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :service_title, :string
    add_column :locations, :service_description, :text
  end
end
