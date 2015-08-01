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
every :monday, :at => '10am' do # Use any day of the week or :weekend, :weekday
  rake "Task.reminds_users_of_submission"
end

every :tuesday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
  rake "not_submitted_reminder"
end

# Learn more: http://github.com/javan/whenever
