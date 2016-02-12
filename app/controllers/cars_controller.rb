class CarsController < ApplicationController
  #only logged in user can access this page
  before_action :authenticate_user!

  def show
    @car = Car.find(params[:id])
  end
end
