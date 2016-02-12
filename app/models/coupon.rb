class Coupon < ActiveRecord::Base
  #Generate a coupon code before create record
  before_create :generate_coupon

  has_many :coupon_dates, dependent: :destroy

  def generate_coupon
    self.coupon_code = unique_token
  end

  #Trigger coupon code email
  def self.offer_coupon
    coupon_dates = CouponDate.where(send_date: Date.today)
    EMAIL_LOGGER.info("sending email to : #{coupon_dates}")
    EMAIL_LOGGER.info("coupon_dates count: #{coupon_dates.count}")
    coupon_dates.each do |coupon_date|
      coupon = coupon_date.coupon
      #Sending the email
      msg = CouponMailer.offer_coupon(coupon).deliver_now
      EMAIL_LOGGER.info("BODY: #{msg.body}")
    end
  end

  private
  #generating a uniq code
  def unique_token
    token = random_string
    loop do
      break unless Coupon.match_token?(token)
      token = random_string
    end
    token
  end

  def self.match_token?(token)
    where(coupon_code: token).present?
  end

  def random_string
    (0..rand(6..15)).map { (65 + rand(26)).chr }.join
  end

end
