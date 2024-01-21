class AppointmentsController < ApplicationController
  before_action :authenticate_advisor!

  def index
    @advisor = current_advisor
    @appointments = @advisor.appointments
  end
end
