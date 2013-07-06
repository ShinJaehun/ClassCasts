class AddLinkToCasts < ActiveRecord::Migration
  def change
	add_column :casts, :link, :string
  end

end
