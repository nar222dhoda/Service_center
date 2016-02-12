class Car < ActiveRecord::Base
  belongs_to :customer

  #Validation:
  validates :customer_id, :car_model, :color, :last_servicing_date, :repair_part, presence: true
end
