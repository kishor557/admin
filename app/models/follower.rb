class Follower < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :admin_users
  has_many :comments, class_name: "PostComment", dependent: :destroy
  #after_create :update_admin_followers
  
  def update_admin_followers
    admin = AdminUser.find(2)
    admin.followers << self
  end
  
  def self.find_for_facebook_oauth(access_token)
   data = access_token['extra']['raw_info']
   follower = Follower.where(email: data["email"]).first

   unless follower
     follower = Follower.create(email: data["email"],
             password: Devise.friendly_token[0,20]
            )
   end
   follower
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    follower = Follower.where(email: data["email"]).first

    unless follower
        follower = Follower.create(email: data["email"],
             password: Devise.friendly_token[0,20]
            )
    end
    follower
  end
end
