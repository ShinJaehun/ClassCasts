class RemoveIsCorrectFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :is_correct
  end

  def down
    add_column :questions, :is_correct, :integer
  end
end
