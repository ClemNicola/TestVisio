class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home
  # before_action :authenticate_advisor!, only: :dashboard

  # skip_before_action :authenticate_advisor!, only: :home
  def home
  end

  def dashboard
  end

  def users
  end

  def advisors
  end
end
