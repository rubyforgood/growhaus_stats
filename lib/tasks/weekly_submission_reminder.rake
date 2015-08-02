task weekly_submission_reminder: :environment do

  User.all.each do | user |
    NotificationMailer.weekly_submission_reminder(user).deliver_now
  end

end
