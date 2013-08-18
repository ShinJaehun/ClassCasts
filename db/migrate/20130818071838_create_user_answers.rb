class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :choice
      t.integer :is_correct
      t.references :survey
      t.references :user
      t.references :question

      t.timestamps
    end
    add_index :user_answers, :survey_id
    add_index :user_answers, :user_id
    add_index :user_answers, :question_id
  end
end
