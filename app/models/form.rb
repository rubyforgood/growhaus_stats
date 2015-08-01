# == Schema Information
#
# Table name: forms
#
#  id              :integer          not null, primary key
#  name            :string
#  google_form_url :string
#  frequency       :string
#  department_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Form < ActiveRecord::Base
  belongs_to :department
  belongs_to :user

  def to_google_file
    user.drive_files
  end
end
