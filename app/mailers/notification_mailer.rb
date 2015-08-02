class NotificationMailer < ApplicationMailer

  def weekly_submission_reminder(user) #occurs on Monday at 10am

    @user = user
    @url = root_url.to_s

    mail(to: user.email, :subject => "Weekly Data Submission Reminder")
  end

  def forms_not_complete(user, forms, departments) #occurs on Wednesday

    @departments = departments
    @forms = forms
    @user = user


    mail(to: user.email, :subject => "Weekly Data Submissions Not Complete")
  end

  def submissions_complete(user) #occurs on Wednesday

    @user = user
    @url = root_url.to_s
    mail(to: user.email, :subject => "Weekly Data Submission Complete")
  end

end
