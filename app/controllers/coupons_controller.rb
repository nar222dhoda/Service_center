class CouponsController < ApplicationController
  #only logged in user can access this page
  before_action :authenticate_user!

  def index
    @coupons = Coupon.all
  end

end
