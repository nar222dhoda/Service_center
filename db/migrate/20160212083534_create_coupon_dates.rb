class CreateCouponDates < ActiveRecord::Migration
  def change
    create_table :coupon_dates do |t|
      t.integer :coupon_id
      t.date :send_date

      t.timestamps null: false
    end
  end
end
