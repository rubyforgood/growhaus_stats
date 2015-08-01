class AddsGoogleSheetUrlToForms < ActiveRecord::Migration
  def change
    add_column :forms, :google_sheet_url, :string
  end
end
