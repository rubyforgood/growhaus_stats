class Form < ActiveRecord::Base
  belongs_to :department
  validates :google_form_url, format: { with: /https:\/\/docs.google.com\/forms.*/, message: 'must start with "https://google.docs.com/forms..."'  }
  validates :google_sheet_url, format: { with: /https:\/\/docs.google.com\/spreadsheet.*/, message: 'must start with "https://google.docs.com/spreadsheet..."'  }

end
