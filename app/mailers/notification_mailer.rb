class NotificationMailer < ApplicationMailer

  def weekly_submission_reminder #occurs on Monday
   
  	emails = User.all.map(&:email)

    mail to: emails
  end

  def not_submitted_reminder #occurs on Tuesday at noon
   
  	emails = 

    mail to: emails
  end

end
