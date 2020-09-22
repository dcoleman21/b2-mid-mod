class SurgeryDoctorsController < ApplicationController
  def create
    doctor = Doctor.find_by(name: params[:name])
    SurgeryDoctor.create(surgery_id: params[:id], doctor_id: doctor.id)
    redirect_to "/surgeries/#{params[:id]}"
  end


  private

  def doctor_params
    params.permit(:name, :specialty, :university)
  end
end
