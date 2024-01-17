class AppointmentTypesController < ApplicationController

  before_action :set_appointment_type, only: %i[show edit update destroy]
  before_action :authenticate_advisor!


  def index
    @appointment_types = current_advisor.appointment_types
  end

  def show
  end

  def new
    if advisor_signed_in?
      @appointment_type = current_advisor.appointment_types.new
    end
  end

  def create
    @appointment_type = current_advisor.appointment_types.new(appointment_type_params)

    if @appointment_type.save
      redirect_to pages_advisors_path, notice: 'Appointment type created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_appointment_type
    @appointment_type = AppointmentType.find(params[:id])
  end

  def appointment_type_params
    params.require(:appointment_type).permit(:name, :location, :color, :duration)
  end
end
