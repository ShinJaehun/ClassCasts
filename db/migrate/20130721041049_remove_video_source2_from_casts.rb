class RemoveVideoSource2FromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :video_source
  end

  def down
    add_column :casts, :video_source, :string
  end
end
