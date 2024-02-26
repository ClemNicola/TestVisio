class NotifierMailer < ApplicationMailer

  default from: 'clementnicolas9937@gmail.com'

  def appointment_email(user, advisor, appointment)
    @advisor = advisor
    @user = user
    @appointment = appointment
    mail(to: @user.email, subject: 'RTV - Your New Appointment')
  end
end
