class AvailabilitiesController < ApplicationController
  before_action :authenticate_advisor!
  before_action :set_availability, only: %i[edit update]
  before_action :set_advisor, only: %i[index new create]

  def index
    @availabilities = @advisor.availabilities
    render json: @advisor.availabilities
  end

  def show
  end

  def new
    @availability = @advisor.availabilities.new
    @availability.start_time = '09:00' if @availability.start_time.blank?
    @availability.end_time = '19:00' if @availability.end_time.blank?
  end

  def create
    @availability = @advisor.availabilities.new(availability_params)
    if @availability.save
      redirect_to pages_advisors_path, notice: 'Availabilities save'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @availability.update(availability_params)
      redirect_to pages_advisors_path, notice: 'Availabilities updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_advisor
    @advisor = current_advisor
  end

  def set_availability
    @availability = current_advisor.availabilities.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :start_time, :end_time)
  end
end
