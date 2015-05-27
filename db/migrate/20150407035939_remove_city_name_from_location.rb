class RemoveCityNameFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :city
  end
end
