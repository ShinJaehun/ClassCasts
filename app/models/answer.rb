class Answer < ActiveRecord::Base
  belongs_to :question

  attr_accessible :content, :correct, :question_id
end

