class ApplicationController < ActionController::Base
  before_action :authenticate_any!

  private

  def authenticate_any!
    if advisor_signed_in?
      true
    else
      authenticate_user!
    end
  end

end
