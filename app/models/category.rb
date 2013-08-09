class Category < ActiveRecord::Base
  attr_accessible :name, :number
  has_many :posts

end
