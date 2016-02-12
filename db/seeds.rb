# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.find_by_email("admin@example.com")
if user.blank?
  User.create(email: 'admin@example.com', password: "password")
end

10.times do |i|
  customer = Customer.create(first_name: "test#{i}", last_name: "#{i}secomd", phone: rand(1000000000..9999999999), email: "d.narenyadav#{i}@gmail.com", address: "#{i} second test address", last_visit_date: Date.today)
  rand(1..10).times do |j|
    customer.cars.create(car_model: "model #{j}" , color: ['red', 'green', 'white'].sample, last_servicing_date: Date.today-rand(28..30).days, repair_part: "test part #{j}")
  end
end

10.times do |i|
  coupon = Coupon.create(description: "Test Coupon description #{i}")
  rand(1..2).times do |j|
    coupon.coupon_dates.create(send_date: Date.today-i.days)
  end
end
