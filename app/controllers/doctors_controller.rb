

class DoctorsController < ApplicationController

  def new
  @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      @errors = @doctor.errors.full_messages
      render :new
    end
  end

  def index
   p helpers.get_insurance
   @q = Doctor.ransack(params[:q])
   @doctors = @q.result
  end

  def show
  end

  private
  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty, :gender, :email_address,:phone_number,:street,:city,:state,:zipcode)
  end

  def full_search_params
  end

end
