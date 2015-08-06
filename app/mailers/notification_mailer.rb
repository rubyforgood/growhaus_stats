class NotificationMailer < ApplicationMailer
  def monday_reminder(user)
    @user = user
    @url  = root_url.to_s

    mail(to: user.email, subject: 'Weekly Data Submission Reminder')
  end

  def wednesday_notify(user)
    @user = user
    @url  = root_url.to_s

    mail(to: user.email, subject: 'Weekly Data Submission Complete')
  end
end
