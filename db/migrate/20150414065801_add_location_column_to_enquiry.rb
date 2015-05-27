class AddLocationColumnToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :location, :string
  end
end
