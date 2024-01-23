class AppointmentsController < ApplicationController
  # before_action :authenticate_an!
  before_action :set_advisor
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.where(advisor_id: @advisor.id)
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = @advisor.appointments.new(appointment_params)
    @appointment.user = current_user

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created'
    else
      render :new
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

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_type_id, :date, :time, :status)
  end
end
