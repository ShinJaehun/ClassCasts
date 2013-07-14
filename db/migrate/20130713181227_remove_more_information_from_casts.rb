class RemoveMoreInformationFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :subject
    remove_column :casts, :grade_semester
    remove_column :casts, :section
    remove_column :casts, :grade
    remove_column :casts, :semester_integer
  end

  def down
    add_column :casts, :semester_integer, :string
    add_column :casts, :grade, :integer
    add_column :casts, :section, :string
    add_column :casts, :grade_semester, :string
    add_column :casts, :subject, :string
  end
end
