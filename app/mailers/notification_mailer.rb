class NotificationMailer < ApplicationMailer

  def weekly_submission_reminder(user, url) #occurs on Monday at 10am
   
  	@user = user
    @url = url

    mail(to: user.email, :subject => "Weekly Data Submission Reminder")
  end

  def not_submitted_reminder(user, url) #occurs on Tuesday at noon
  
    @user = user
    @url = url

    mail(to: user.email, :subject => "Weekly Data Submission Reminder, Part 2")
  end

  def submissions_complete(user) #occurs on Wednesday
   
  	@user = user

    mail(to: user.email, :subject => "Data Submission Complete")
  end	  

end
