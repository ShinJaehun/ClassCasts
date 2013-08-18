class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :content, :survey_id, :answers_attributes, :is_correct

def init
    self.is_correct = false
    answers.each do |a|
      a.user_answer = false
    end
 end

def update(check)
    a =  Answer.find_by_id(check)
    a.update_attribute(:user_answer, true)
end

def auto_check
    #for a in answers
    answers.each do |a|
    #a = params[:answer]
    #update_attribute(:is_correct, true)
    self.is_correct = true  if a.user_answer == true and a.correct == true
    #self.save!
    end
   #update_attribute(:is_correct, true)
 end

  
end

