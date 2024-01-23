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
  end

  def users
    @user = current_user
  end

  def advisors
    @advisor = current_advisor
    @appointment_types = @advisor.appointment_types
    @availabilities = @advisor.availabilities
  end
end
