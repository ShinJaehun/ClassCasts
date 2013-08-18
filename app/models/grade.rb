class Grade < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :average_grade, :survey_id

  attr_accessor :answer

  def calculate_grade(correct_answers, responses)
    responses = Grade.isolate_responses(responses)
    total = correct_answers.length.to_f
    correct = Grade.correct!(correct_answers, responses)
    average = (correct / total) * 100
  end

  def self.correct!(correct_answers, responses) # Returns number of correct answers
    responses.each do |response|
      response.each_value do |aid|
        unless correct_answers.include?(aid)
          responses.delete(response)
        end
      end
    end
    responses.length.to_f
  end

  def self.isolate_responses(input) # Clean up hash to make it easier to manipulate
    responses = Array.new
    input.each do |qid, answer|
      answer.each_value do |aid|
        responses << {qid=>aid}
      end
    end
    responses
  end

end
