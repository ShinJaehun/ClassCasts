class RemoveCategoryAndPosts < ActiveRecord::Migration
  def up
	drop_table :categories_posts

  end

  def down
    raise ActiveRecord::IrreversibleMigration

  end
end
