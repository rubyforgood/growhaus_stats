class Form < ActiveRecord::Base
  belongs_to :department
  validates :google_form_url, format: { with: /https:\/\/google.docs.com\/forms.*/, message: 'must start with "https://google.docs.com/forms..."'  }

end
