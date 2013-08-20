class RemoveCorrectFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :correct
  end

  def down
    add_column :answers, :correct, :boolean
  end
end
