class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :average_grade
      t.references :survey

      t.timestamps
    end
    add_index :grades, :survey_id
  end
end
