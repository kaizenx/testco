class CompaniesController < ApplicationController
  before_action :set_location
  before_action :set_company, only: [:destroy, :edit, :update]
  def new
    @company = @location.companies.build
  end

  def create
    @company = @location.companies.build(companies_params)
    if @company.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(companies_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @company = @location.companies.find(params[:id])
    @company.destroy
    redirect_to dashboard_path
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_company
    @company = @location.companies.find(params[:id])
  end

  def companies_params
    params.require(:company).permit(:name, :description, :image)
  end
end
