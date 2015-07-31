class NotificationMailer < ApplicationMailer

  def weekly_submission_reminder #occurs on Monday
   
  	@users = User.all #.find_by(admin: true)
  	emails = users.all.map(&:email)

    mail(to: emails, :subject => "Weekly Data Submission Reminder")
  end

  def not_submitted_reminder #occurs on Tuesday at noon
    
    @users = User.all #.find_by(admin: true)
  	emails = users.all.map(&:email)

    mail(to: emails, :subject => "Weekly Data Submission Reminder, Part 2")
  end

  def submissions_complete #occurs on Tuesday at noon
   
  	emails = User #.find_by(admin: true)

    mail(to: emails, :subject => "Data Submission Complete")
  end	  

end
