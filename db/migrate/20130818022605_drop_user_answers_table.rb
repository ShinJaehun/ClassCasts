class DropUserAnswersTable < ActiveRecord::Migration
  def up
	drop_table :user_answers
  end

  def down
    raise ActiveRecord::IrreversibleMigration

  end
end
