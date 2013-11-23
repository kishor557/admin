class Post < ActiveRecord::Base
 # def to_param
 #   title.parameterize
 # end
 has_many :comments, class_name: 'PostComment', dependent: :destroy
 belongs_to :user, class_name: "AdminUser", foreign_key: :admin_user_id
 validates :title, presence: true, uniqueness: true
end
