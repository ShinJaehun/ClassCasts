class AddUserIdToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :user_id, :integer
    add_index :grades, :user_id
  end
end
