class Cast < ActiveRecord::Base
  attr_accessible :description, :video_link, :title, :chapter, :grade_semester

  scope :five, where("grade_semester == 2 or grade_semester == 3")
  scope :six, where("grade_semester == 4 or grade_semester == 5")
  scope :recent, order("created_at desc")

	def self.search(search, page)
	  paginate :per_page => 10, :page => page,
	           :conditions => ['description like ?', "%#{search}%"],
	           :order => 'created_at DESC'
	end

end
