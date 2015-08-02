# Use this file to easily define all of your cron jobs.

# weekly reminder email
every :monday, :at => '10am' do # Use any day of the week or :weekend, :weekday
  rake "weekly_submission_reminder"
end

# second reminder email, used if it was possible to identify unfilled forms and their owners
# every :tuesday, :at => '11am' do # Use any day of the week or :weekend, :weekday
#   rake "not_submitted_reminder"
# end

# completion email to be sent to the superusers/admin
#every :wednesday, :at => '12pm' do
#  rake "submissions_complete"
#end

