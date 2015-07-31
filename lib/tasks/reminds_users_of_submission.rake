task reminds_users_of_submission: :environment do

  Department.each do | d |
      if d.name == "Distribution"
        url = "http://entercorrecturl.distribution.com"
      elsif d.name == "Production"
        url = "http://entercorrecturl.production.com"
      elsif d.name == "Education"
        url = "http://entercorrecturl.education.com"
      else
        url = root_url
      end
    d.users.each do | user |
      NotificationMailer.weekly_submission_reminder(user, url).deliver_now
    end
  end

end
