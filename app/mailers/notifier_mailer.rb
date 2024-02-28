class NotifierMailer < ApplicationMailer

  default from: 'clementnicolas9937@gmail.com'

  def appointment_email(user, advisor, appointment)
    @advisor = advisor
    @user = user
    @appointment = appointment
    mail(to: @user.email, subject: 'RTV - Your New Appointment')
  end

  def validation_email(user, advisor, appointment,status)
    @advisor = advisor
    @user = user
    @appointment = appointment
    @status = status

    subject = if @status == "approved"
                'RTV - Your Appointment Has Been Approved'
              else
                'RTV - Your Appointment Has Been Disapproved'
              end
    mail(to: @user.email, subject: subject)
  end
end
