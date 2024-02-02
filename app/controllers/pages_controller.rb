class PagesController < ApplicationController

  skip_before_action :authenticate_any!, only: :home
  before_action :authenticate_advisor!, only: [:advisors]
  before_action :authenticate_user!, only: [:users]

  # skip_before_action :authenticate_advisor!, only: :home
  def home
    @advisors = Advisor.all
  end

  def show_advisor
    @advisor = Advisor.find(params[:id])
    @appointment_types = AppointmentType.where(advisor_id: @advisor.id)
  end

  def users
    @user = current_user
  end

  def advisor
    @advisor = current_advisor
  end
end
