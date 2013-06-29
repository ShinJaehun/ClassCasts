class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :source_code

      t.timestamps
    end
  end
end
