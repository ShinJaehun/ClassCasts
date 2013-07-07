class AddVideoSourceToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :video_source, :string
  end
end
