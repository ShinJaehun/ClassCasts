class RemoveQuestionIdFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :question_id
  end

  def down
    add_column :answers, :question_id, :integer
  end
end
