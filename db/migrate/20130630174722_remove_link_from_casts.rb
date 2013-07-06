class RemoveLinkFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :link
  end

  def down
    add_column :casts, :link, :string
  end
end
