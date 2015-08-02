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

  attr_reader :google_sheet

  def gid
    @gid ||= google_sheet_url.to_s.split('gid=').last
  end

  def last_updated
    if to_worksheet && to_worksheet.rows.length > 1
      timestamp_index = to_worksheet.rows.first.index('Timestamp')
      @last_updated ||= to_worksheet.rows.last[timestamp_index]
    end
  rescue
    nil
  end

  def to_worksheet
    if google_sheet
      @worksheet ||= google_sheet.worksheets.find do |worksheet|
        worksheet.gid == gid
      end
    end
  end

  private

  def google_sheet
    if user && google_sheet_url
      @google_sheet ||= user.drive_files(google_sheet_url)
    end
  end
end
