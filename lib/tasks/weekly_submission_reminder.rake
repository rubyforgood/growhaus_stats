task weekly_submission_reminder: :environment do

  User.each do | user |
    NotificationMailer.weekly_submission_reminder(user).deliver_now
  end

end
