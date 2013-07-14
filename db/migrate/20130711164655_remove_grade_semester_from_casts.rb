class RemoveGradeSemesterFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :grade_semester
  end

  def down
    add_column :casts, :grade_semester, :string
  end
end
