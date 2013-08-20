class AddExplainToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :explain, :text
  end
end
