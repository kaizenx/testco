class ProfilesController < ApplicationController
  
  def index
    @profiles = Profile.all
    @locations = Location.all.limit(3)
  end
end
