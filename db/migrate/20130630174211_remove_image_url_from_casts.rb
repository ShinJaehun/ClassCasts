class RemoveImageUrlFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :image_url
  end

  def down
    add_column :casts, :image_url, :string
  end
end
