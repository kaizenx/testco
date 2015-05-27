class AddDefaultToLocationTitles < ActiveRecord::Migration
  def up
    change_column :locations, :service_title, :string, default: 'Our services'
    change_column :locations, :mentor_title, :string, default: 'Mentorship'
    change_column :locations, :company_title, :string, default: 'Our companies'
    change_column :locations, :map_title, :string, default: 'Finding us'
  end

  def down

  end
end
