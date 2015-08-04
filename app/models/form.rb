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
                                         message: 'must start with "https://docs.google.com/forms..."'  }
  validates :google_sheet_url, format: { with:    /https:\/\/docs.google.com\/spreadsheet.*/,
                                         message: 'must start with "https://docs.google.com/spreadsheet..."'  }

  attr_reader :google_sheet

  def self.with_revenue
    where("name ~* 'revenue'")
  end

  def columns
    @columns ||= to_worksheet.rows.first
  end

  def data
    to_worksheet.rows[1..-1]
  end

  def gid
    @gid ||= google_sheet_url.to_s.split('gid=').last
  end

  def last_updated
    return @last_updated if @last_updated

    index = columns.map(&:downcase).index('timestamp')
    value = data.last[index] unless data.blank?

    @last_updated = (value.present? ? value : to_worksheet.updated)
  rescue
    nil
  end

  def revenue(last = 4)
    result    = []
    data_rows = data[last * -1, last]

    data_rows.each do |row|
      hash   = Hash[columns.zip(row)]
      date   = hash.find { |i, _| i =~ /month/i }.last
      amount = hash.select { |i, _| i =~ /(revenue|amount)/i }.values.reduce { |i, j| i.to_f + j.to_f }

      result << [date, amount]
    end

    result
  rescue
    Array.new(last) { [] }
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
