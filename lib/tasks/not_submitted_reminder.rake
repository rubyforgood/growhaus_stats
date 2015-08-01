task not_submitted_reminder: :environment do

  Department.all.each do | d |
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
      NotificationMailer.not_submitted_reminder(user, url).deliver_now
    end
  end

end