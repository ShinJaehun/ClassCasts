class Comment < ActiveRecord::Base
  belongs_to :post,  :counter_cache => true
  belongs_to :user
  attr_accessible :body, :post_id, :user_id

  
end
