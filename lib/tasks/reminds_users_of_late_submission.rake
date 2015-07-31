task reminds_users_of_late_submission: :environment do
	
  Department.each do | d |
      if d == "distribution" 
		    url = "http://entercorrecturl.distribution.com"
		  elsif d == "production"
		    url = "http://entercorrecturl.production.com"
		  elsif d == "education"
		  	url = "http://entercorrecturl.education.com"
		  else
		  	url = root_url
		  end
    d.users.each do | user |
		  NotificationMailer.not_submitted_reminder(user, url).deliver_now 
		end
	end

end

end
