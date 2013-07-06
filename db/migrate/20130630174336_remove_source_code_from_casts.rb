class RemoveSourceCodeFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :source_code
  end

  def down
    add_column :casts, :source_code, :string
  end
end
