class AddVideoIdToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :video_id, :string
  end
end
