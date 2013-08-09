class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments, :dependent => :destroy
  attr_accessible :content, :title, :category_id

    scope :recent, order("created_at desc")
    scope :just5, order("created_at desc").limit(5)
    scope :notice, lambda {
    	joins(:category).
    	where('number == ?', 1)}
    scope :faq, lambda {
    	joins(:category).
    	where('number == ?', 2)}
   scope :qna, lambda {
    	joins(:category).
    	where('number == ?', 3)}
        	
    #scope :faq, lambda {|number| joins(:category).where('category.number '== 2 )}
    #scope :qna, lambda {|number| joins(:category).where('category.number '== 3 )}


	def self.search(search, page)
	  paginate :per_page => 20, :page => page,
	           :conditions => ['content like ?', "%#{search}%"],
	           :order => 'created_at DESC'
	end

end
