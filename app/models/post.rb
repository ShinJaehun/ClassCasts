class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :content, :title, :category_id

    scope :recent, order("created_at desc")


	def self.search(search, page)
	  paginate :per_page => 10, :page => page,
	           :conditions => ['content like ?', "%#{search}%"],
	           :order => 'created_at DESC'
	end
  
end
