class Customer < ActiveRecord::Base

  #Validation:
  validates :email, :first_name, :last_name, :phone, :address, presence: true
  validates_formatting_of :email, using: :email, if: '!email.blank?'

  #association with cars:
  # Customer can have many cars
  # Car details will be deleted with customer destroy so added dependent: :destroy
  has_many :cars, dependent: :destroy


  #After how many days we want to send notification to customer
  DEFAULT_INTERVAL = 30

  #Class method to send notification
  def self.next_servicing
    #(Date.today-Customer::DEFAULT_INTERVAL.days) :: Finding 30 days before date
    @cars = Car.where(last_servicing_date: (Date.today-Customer::DEFAULT_INTERVAL.days))
    @cars.each do |car|
      #Sending eails
      msg = ServicingNotificationMailer.servicing_notification(car).deliver_now
      EMAIL_LOGGER.info("sending email to : #{car.customer.email}")
      EMAIL_LOGGER.info("BODY: #{msg}")
    end
  end

  def full_name
    first_name + " " + last_name
  end

end
