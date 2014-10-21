module UsersHelper

  def follow_link (user)
    link_to "Follow", user_follow_path(user), :method => :post

  end


  def unfollow_link (user)
    link_to "Unfollow", user_follow_path(user), :method => :delete

  end

end