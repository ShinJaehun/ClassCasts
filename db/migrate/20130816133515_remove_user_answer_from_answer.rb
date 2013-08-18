class RemoveUserAnswerFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :user_answer
  end

  def down
    add_column :answers, :user_answer, :boolean
  end
end
