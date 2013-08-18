class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy, :order => 'created_at desc'
  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  attr_accessible :content, :survey_id, :answers_attributes
end
