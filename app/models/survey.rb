class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy, :order => 'created_at desc'

  # railscasts 196, nested model form
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  # :questions_attributes 주의할 것
  attr_accessible :attpmpts, :description, :name, :questions_attributes

end

