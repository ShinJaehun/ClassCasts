class AddCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, :default => 0

    Post.reset_column_information

    Post.find_each do |p|
	Post.reset_counters p.id, :comments
    end
#    Post.all.each do |p|
#	Post.reset_counters(p.id, :comments_count)
#    end

  end
end
