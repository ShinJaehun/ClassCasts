class RemoveInformationFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :cast_subject
    remove_column :casts, :cast_grade_semester
    remove_column :casts, :cast_section
  end

  def down
    add_column :casts, :cast_section, :string
    add_column :casts, :cast_grade_semester, :string
    add_column :casts, :cast_subject, :string
  end
end
