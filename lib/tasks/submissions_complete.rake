task submissions_complete: :environment do

  users = User.find_by(admin: true)
  users.each { | user | NotificationMailer.submissions_complete(user).deliver_now}

end