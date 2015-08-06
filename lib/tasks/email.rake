namespace :email do
  task monday_reminder: :environment do
    User.all.each do |user|
      NotificationMailer.monday_reminder(user).deliver_now
    end
  end

  task incomplete_forms: :environment do
    # TODO: Detect incomplete forms and notify
  end

  task wednesday_notify: :environment do
    users = User.where(role: 'admin')

    users.each do |user|
      NotificationMailer.wednesday_notify(user).deliver_now
    end
  end
end
