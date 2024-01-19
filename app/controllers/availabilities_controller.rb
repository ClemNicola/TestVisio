class AvailabilitiesController < ApplicationController
  before_action :authenticate_advisor!
  # before_action :set_advisor, only: %i[new create]

  def show

  end

  def new
    @advisor = current_advisor
    @availability = @advisor.availabilities.new
  end

  def create
    @availability = @advisor.availabilities.new(availability_params)
    if @availability.save
      redirect_to pages_advisors_path, notice: 'Availabilities save'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  # def set_advisor
  #   @advisor =  @advisor = Advisor.find(params[:advisor_id])
  # end

  def availability_params
    params.require(:availability).permit(:day_of_week, :star_time, :end_time)
  end
end
