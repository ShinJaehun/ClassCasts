class QuestionsController < ApplicationController

def auto_check
    answers.each do |a|
    is_correct = true  if a.user_answer and a.correct                      
    self.save!
   end
 end
 
end
