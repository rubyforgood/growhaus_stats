task reminds_users_of_submission: :environment do
	
  Department.each do | d |
      if d == "volunteer" 
		    url = "entercorrecturl.volunteer.com"
		  elsif d == "farmers"
		    url = "entercorrecturl.volunteer.com"
		  elsif d == "sellers"
		  	url = "entercorrecturl.sellers.com"
		  else
		  	url = root_url
		  end
    d.users.each do | user |
		  PatronMailer.tour_reminder(user, url).deliver_now 
		end
	end
	
end
