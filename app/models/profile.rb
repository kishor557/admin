class Profile < ActiveRecord::Base
 belongs_to :user, class_name: "AdminUser", foreign_key: :admin_user_id
 
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 
 validates :first_name, presence: true
end
