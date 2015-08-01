task submissions_complete: :environment do

  users = User.find_by(admin: true)
  url = "urlforsubmissionsoverview.com"
  users.each { | user | NotificationMailer.submissions_complete(user, url).deliver_now}

end