class Cast < ActiveRecord::Base
  attr_accessible :description, :video_link, :title, :video_id, :video_source, :chapter, :grade_semester

  before_save :extract_video_id_and_video_source

  scope :five, where("grade_semester == 2 or grade_semester == 3")
  scope :six, where("grade_semester == 4 or grade_semester == 5")
  scope :recent, order("created_at desc")

  def extract_video_id_and_video_source
  	self.video_id = self.video_link.split('/').last
  	self.video_source = "//www.youtube.com/embed/" + video_id
  end


end
