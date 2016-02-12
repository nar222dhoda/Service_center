class CustomersController < ApplicationController
  #only logged in user can access this page
  before_action :authenticate_user!

  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def cars
    @customer = Customer.find(params[:id])
    @cars = @customer.cars
  end

end
