class CategoriesAndPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts, :id => false do |t|
      t.integer :category_id
      t.integer :post_id
    end
    add_index :categories_posts, [:category_id, :post_id]
  end

end
