class NotificationMailer < ApplicationMailer

  def weekly_submission_reminder #occurs on Monday
   
  	emails = User.all.map(&:email)

    mail to: emails, :from => "info@growhaus.com", :subject => "Weekly Data Submission Reminder"
  end

  def not_submitted_reminder #occurs on Tuesday at noon
   
  	emails = User.all.map(&:email)

    mail to: emails, :from => "info@growhaus.com", :subject => "Weekly Data Submission Reminder, Part 2"
  end

  def submissions_complete #occurs on Tuesday at noon
   
  	emails = User.find_by(admin: true)

    mail to: emails, :from => "info@growhaus.com", :subject => "Data Submission Complete"
  end	  

end
