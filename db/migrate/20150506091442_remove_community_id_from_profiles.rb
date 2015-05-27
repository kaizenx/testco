class RemoveCommunityIdFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :community_id 
  end
end
