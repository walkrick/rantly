module UsersHelper
  def follow_link (user)
    if current_user.following? user

      link_to "Unfollow", user_follow_path(user), :method => :delete

    else
      link_to "Follow", user_follow_path(user), :method => :post
    end
  end

  def full_name(user)
    [user.first_name, user.last_name].join(' ')
  end

end


