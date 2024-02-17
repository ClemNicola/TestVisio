class AppointmentsController < ApplicationController
  # before_action :authenticate_an!
  before_action :set_advisor, only: %i[show new create]
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.where(advisor_id: @advisor.id)
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @week_dates = week_dates
    @appointment_types = @advisor.appointment_types
    # @appointment_types = AppointmentType.where(advisor_id: @advisor.id)
    @availabilities = @advisor.availabilities
    @appointment.user = current_user
  end

  def create
    @appointment = @advisor.appointments.new(appointment_params)
    @appointment.user = current_user

    if @appointment.save
      redirect_to root_path, notice: 'Appointment was successfully created'
    else
      # @week_dates = week_dates  # Ajoutez cette ligne
      # @appointment_types = @advisor.appointment_types
      # @availabilities = @advisor.availabilities
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

  def week_dates
    today = Date.today
    start_of_week = today.beginning_of_week(:monday)
    (start_of_week..start_of_week + 6.days).map do |date|
      [date.strftime('%A'), date]
    end
  end

  def set_advisor
    @advisor = Advisor.find(params[:advisor_id])
  end

  # def set_appointment
  #   @appointment = Appointment.find(params[:id])
  # end

  def appointment_params
    params.require(:appointment).permit(:appointment_type_id, :date, :time, :status, :user_id)
  end
end
