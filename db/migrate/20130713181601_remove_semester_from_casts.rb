class RemoveSemesterFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :semester
  end

  def down
    add_column :casts, :semester, :integer
  end
end
