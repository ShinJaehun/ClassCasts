class AddIsCorrectToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :is_correct, :boolean, :default => false
  end
end
