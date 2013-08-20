class DropGrade < ActiveRecord::Migration
  def up
	drop_table :grades
  end

  def down
  end
end
