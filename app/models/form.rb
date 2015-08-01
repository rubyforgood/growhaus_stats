# == Schema Information
#
# Table name: forms
#
#  id               :integer          not null, primary key
#  name             :string
#  google_form_url  :string
#  frequency        :string
#  department_id    :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  google_sheet_url :string
#

class Form < ActiveRecord::Base
  belongs_to :department
  belongs_to :user
  
  validates :google_form_url,  format: { with:    /https:\/\/docs.google.com\/forms.*/, 
                                         message: 'must start with "https://google.docs.com/forms..."'  }
  validates :google_sheet_url, format: { with:    /https:\/\/docs.google.com\/spreadsheet.*/, 
                                         message: 'must start with "https://google.docs.com/spreadsheet..."'  }

  def to_google_sheet
    google_sheet_url && user.drive_files(google_sheet_url)
  end
end
