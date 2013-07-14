class AddInformationToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :subject, :string, :after => :description
    add_column :casts, :grade_semester, :string
    add_column :casts, :chapter, :string
    add_column :casts, :section, :string
  end
end
