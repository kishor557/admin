class Notifier < ActionMailer::Base
  default from: "kishore@rubyeffect.com"
  
  def follow(user)
    @follower = user
    mail(to: user.email,
         subject: "Thank you for following RoR Magick Blog")
  end
  
  def unfollow(user)
    @follower = user
    mail(to: user.email,
         subject: "You are unfollowed from RoR Magick Blog")
  end
end
