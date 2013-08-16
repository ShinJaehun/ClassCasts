class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  attr_accessible :attpmpts, :description, :name, :questions_attributes

end

