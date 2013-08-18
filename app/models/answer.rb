class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  attr_accessible :content, :question_id, :correct
end
