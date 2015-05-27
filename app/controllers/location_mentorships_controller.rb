class LocationMentorshipsController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @mentorship = @location.location_mentorships.build
  end

  def create
    @location = Location.find(params[:location_id])
    @mentorship = @location.location_mentorships.build(location_mentorship_params)
    if @mentorship.save
      redirect_to location_path(@location, anchor: 'p3')
    else
      render :new
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @mentorship =LocationMentorship.find(params[:id])
    @mentorship.destroy
    redirect_to location_path(@location, anchor: 'p3')
  end

  private

  def location_mentorship_params
    params.require(:location_mentorship).permit(
      :mentor_id
    )
  end
end
