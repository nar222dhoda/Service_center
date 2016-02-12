# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#scheduling the task on particular time
every :day, :at => '09:13 am' do
  runner "Customer.next_servicing"
end

every :day, :at => '09:15 am' do
  runner "Coupon.offer_coupon"
end

#Run this commands
#whenever -w => to write cron task
#whenever --update-crontab --set environment=development
