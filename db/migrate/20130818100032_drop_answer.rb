class DropAnswer < ActiveRecord::Migration
  def up
	drop_table :answers
  end

  def down
  end
end
