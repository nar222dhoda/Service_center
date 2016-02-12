class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :customer
      t.string :car_model
      t.string :color
      t.date :last_servicing_date
      t.text :repair_part

      t.timestamps null: false
    end
  end
end
