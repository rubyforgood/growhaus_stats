class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :google_form_url
      t.string :frequency
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
