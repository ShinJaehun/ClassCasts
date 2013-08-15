class AddUserAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :user_answer, :boolean
  end
end
