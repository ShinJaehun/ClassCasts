class DropTableUserAnswer < ActiveRecord::Migration
  def up
	drop_table :user_answers
  end

  def down
  end
end
