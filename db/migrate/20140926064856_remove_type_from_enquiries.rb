class RemoveTypeFromEnquiries < ActiveRecord::Migration
  def up
    remove_column :enquiries, :type
  end

  def down
    add_column :enquiries, :type, :string
  end
end
