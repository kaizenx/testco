class CommunitiesController < ApplicationController
  before_action :find_community, only: :show
  
  def index
    @community_members = Profile.all_community
    @partners = Profile.all_partners
    @team_members = Profile.all_team
  end

  def show
    
  end

  private
  
  def find_community
    @community = Community.find(params[:id])
  end
end
