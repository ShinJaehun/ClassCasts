class AddTwoBooleanToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :correct, :boolean, :default => false

    add_column :answers, :user_answer, :boolean, :default => false
  end
end
