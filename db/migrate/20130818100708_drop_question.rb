class DropQuestion < ActiveRecord::Migration
  def up
	drop_table :questions
  end

  def down
  end
end
