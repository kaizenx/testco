class CreateAssignedRoles < ActiveRecord::Migration
  def change
    create_table :assigned_roles do |t|
      t.integer  :role_id, null: false
      t.integer  :profile_id, null: false
      t.timestamps null: false
    end
  end
end
