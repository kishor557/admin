module FollowersHelper
  
  def followers
    "No Followers" if @admin.followers.empty?
    "#{pluralize(@admin.followers.size, 'member')} are following your blog"
  end

end
