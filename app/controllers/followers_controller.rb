class FollowersController < ApplicationController
  before_filter :authenticate_follower!
  
  def index
    return if !params[:type]
    case(params[:type])
      when "follow"
        @admin.followers << current_follower
        #Notifier.follow(current_follower).deliver
      when "unfollow"  
        @admin.followers.delete(current_follower)
        #Notifier.unfollow(current_follower).deliver
    end
    redirect_to :back
  end
end
