class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home
  before_action :authenticate_advisor!, only: [:advisors]
  before_action :authenticate_user!, only: [:users]

  # skip_before_action :authenticate_advisor!, only: :home
  def home
  end

  # def dashboard
  # end

  def users
    @user = current_user
  end

  def advisors
    Rails.logger.debug "Current Advisor: #{current_advisor.inspect}, Signed In: #{advisor_signed_in?}"
    @advisor = current_advisor
  end
end
