class EnquiriesController < ApplicationController
  def create
    Enquiry.create(enquiry_params)
    redirect_to :back, notice: 'Thank you, your enquiry has been sent.'
  end

  private

  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :company, :phone, :types, :message)
  end
end
