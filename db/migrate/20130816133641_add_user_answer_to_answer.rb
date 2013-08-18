class AddUserAnswerToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :user_answer, :boolean, :default => false
  end
end
