class AddInGradeAndSemesterToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :grade, :integer
    add_column :casts, :semester, :integer
  end
end
