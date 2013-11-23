class PostComment < ActiveRecord::Base
 self.inheritance_column = nil
 
 belongs_to :post
 belongs_to :follower
end
