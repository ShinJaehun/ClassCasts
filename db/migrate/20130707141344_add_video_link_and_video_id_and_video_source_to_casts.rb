class AddVideoLinkAndVideoIdAndVideoSourceToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :video_id, :string
    add_column :casts, :video_source, :string
  end
end
