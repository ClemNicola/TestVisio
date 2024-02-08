class PagesController < ApplicationController

  skip_before_action :authenticate_any!, only: :home
  before_action :authenticate_advisor!, only: [:advisors]
  before_action :authenticate_user!, only: [:users]

  # skip_before_action :authenticate_advisor!, only: :home
  def home
    @advisors = Advisor.all
  end

  def show_advisor
    @week_dates = week_dates
    @advisor = Advisor.find(params[:id])
    @appointment_types = AppointmentType.where(advisor_id: @advisor.id)
    @availabilities = @advisor.availabilities
  end

  def users
    @user = current_user
  end

  def advisor
    @advisor = current_advisor
  end

  private

  def week_dates
    today = Date.today
    start_of_week = today.beginning_of_week(:monday)
    (start_of_week..start_of_week + 6.days).map do |date|
      [date.strftime('%A'), date]
    end
  end

end
