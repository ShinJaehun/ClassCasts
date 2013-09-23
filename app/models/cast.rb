class Cast < ActiveRecord::Base
  attr_accessible :description, :video_link, :title, :chapter, :grade_semester

  # 5학년 1학기, 2학기
  scope :five, where("grade_semester == 2 or grade_semester == 3")
  # 6학년 1학기, 2학기
  scope :six, where("grade_semester == 4 or grade_semester == 5")
  # 내림차순 정렬
  scope :recent, order("created_at desc")
  scope :just5, order("created_at desc").limit(5)


	def self.search(search, page)
	# for paganation
	  paginate :per_page => 10, :page => page,
	           :conditions => ['description like ?', "%#{search}%"],
	           :order => 'created_at DESC'
	end

end
