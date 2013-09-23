class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy, :order => 'created_at desc'

  # railscasts 196, nested model form
  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  # :answers_attributes 주의할 것
  attr_accessible :content, :survey_id, :is_correct, :explain, :answers_attributes

end
