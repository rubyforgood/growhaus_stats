class AddDepartmentIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :department, index: true, foreign_key: true
  end
end
