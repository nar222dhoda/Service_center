class ServicingNotificationMailer < ApplicationMailer

  def servicing_notification(car)
    @car = car
    @customer = @car.customer
    mail(to: @customer.email, subject: 'Next Servicing Notification')
  end
end
