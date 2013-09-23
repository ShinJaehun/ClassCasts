class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments, :dependent => :destroy
  attr_accessible :content, :title, :category_id

  	# post 내림차순으로 정렬
	scope :recent, order("created_at desc")

  	# post view index.html.erb에 화면 오른쪽에 공지사항, FAQ, QNA, 수업영상을 표시
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

	def self.search(search, page)
	# for pagination
	  paginate :per_page => 20, :page => page,
	           :conditions => ['content like ?', "%#{search}%"],
	           :order => 'created_at DESC'
	end

end
