class AddGradeSemesterToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :grade_semester, :integer
  end
end
