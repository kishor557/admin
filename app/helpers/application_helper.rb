module ApplicationHelper

  def link_to_admin_profile(admin)
    link_to (admin.profile ? admin.full_name : admin.email), profile_path(admin.profile)
  end
 
  def devise_mapping
     Devise.mappings[:follower]
  end
 
  def resource_name
    devise_mapping.name
  end
 
  def resource_class
    devise_mapping.to
  end
end
