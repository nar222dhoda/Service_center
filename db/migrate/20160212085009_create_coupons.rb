class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.text :description

      t.timestamps null: false
    end
  end
end
