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
    @availabilities = @advisor.availabilities
    @appointment.user = current_user
  end

  def create

    # puts "appointment_params: #{appointment_params.inspect}"
    @appointment = @advisor.appointments.new(appointment_params)
    @appointment.user = current_user


    if @advisor.available_on?(@appointment.date, @appointment.advisor_hours, @appointment.appointment_type_id) && @appointment.save
      NotifierMailer.appointment_email(@appointment.user, @advisor, @appointment).deliver_now
      redirect_to root_path, notice: 'Appointment was successfully created'
    else
      puts @appointment.errors.full_messages
      flash[:appointment_params] = appointment_params
      redirect_to show_advisor_path(@advisor), alert: 'There was an error creating the appointment'
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
    params.require(:appointment).permit(:appointment_type_id, :advisor_hours, :date, :first_name, :last_name, :mobile, :status)
  end
end
