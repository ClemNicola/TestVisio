class AppointmentTypesController < ApplicationController
  before_action :set_advisor, only: %i[index new create]
  before_action :set_appointment_type, only: %i[show edit update destroy]
  before_action :authenticate_advisor!, only: %i[new create edit update destroy]
  # skip_before_action :authenticate_advisor!, only: %i[new create edit update destroy]

  def index
    @appointment_types = AppointmentType.where(advisor_id: @advisor.id)
  end

  def show
  end

  def new
    @appointment_type = @advisor.appointment_types.new
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

  def set_advisor
    @advisor = Advisor.find(params[:advisor_id])
  end
  def set_appointment_type
    @appointment_type = AppointmentType.find(params[:id])
  end

  def appointment_type_params
    params.require(:appointment_type).permit(:name, :location, :description, :color, :duration)
  end
end
