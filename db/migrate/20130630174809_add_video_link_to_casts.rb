class AddVideoLinkToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :video_link, :string
  end
end
