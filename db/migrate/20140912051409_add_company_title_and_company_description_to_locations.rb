class AddCompanyTitleAndCompanyDescriptionToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :company_title, :string
    add_column :locations, :company_description, :text
  end
end
