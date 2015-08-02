task forms_not_complete: :environment do

  # departments = Department.where(id: Form.where("updated_at >= ?", Date.today-5).select(:department_id))
  # users = User.find_by(admin: true)
  # forms = Form.where("updated_at >= ?", Date.today-5)

  # users.each { | user | NotificationMailer.forms_not_complete(user, forms, departments).deliver_now }

end