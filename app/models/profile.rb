class Profile < ActiveRecord::Base
 belongs_to :user, class_name: "AdminUser", foreign_key: :admin_user_id
 
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/NoPicture.jpg"
 
 validates :first_name, presence: true
end
