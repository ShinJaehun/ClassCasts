class RemoveVideoIdFromCasts < ActiveRecord::Migration
  def up
    remove_column :casts, :video_id
  end

  def down
    add_column :casts, :video_id, :string
  end
end
