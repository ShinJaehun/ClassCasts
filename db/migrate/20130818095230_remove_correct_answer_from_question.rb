class RemoveCorrectAnswerFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :correct_answer
  end

  def down
    add_column :questions, :correct_answer, :integer
  end
end
