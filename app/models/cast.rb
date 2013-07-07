class Cast < ActiveRecord::Base
  attr_accessible :description, :video_link, :title, :video_id, :video_source

  before_save :extract_video_id_and_video_source


  def extract_video_id_and_video_source
  	self.video_id = self.video_link.split('/').last
  	self.video_source = "//www.youtube.com/embed/" + video_id
  end


end
