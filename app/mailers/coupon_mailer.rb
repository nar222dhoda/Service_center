class CouponMailer < ApplicationMailer

  def offer_coupon(coupon)
    @coupon = coupon
    @customers = Customer.all.pluck(:email)
    mail(to: @customers, subject: 'Offer Coupon')
  end
end
