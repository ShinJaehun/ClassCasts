class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  attr_accessible :content, :title
end
