# Use this file to easily define all of your cron jobs.

# weekly reminder email
every :monday, :at => '10am' do
  rake "weekly_submission_reminder"
end

# email to identify incomplete forms, if it were possible
# every :tuesday, :at => '11am' do
#   rake "forms_not_complete"
# end

# completion email to be sent to the superusers/admin
#every :wednesday, :at => '12pm' do
#  rake "submissions_complete"
#end

