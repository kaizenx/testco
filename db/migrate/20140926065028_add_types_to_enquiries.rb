class AddTypesToEnquiries < ActiveRecord::Migration
  def change
    add_column :enquiries, :types, :string
  end
end
