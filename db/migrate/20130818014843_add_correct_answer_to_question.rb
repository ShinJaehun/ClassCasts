class AddCorrectAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :correct_answer, :integer
  end
end
