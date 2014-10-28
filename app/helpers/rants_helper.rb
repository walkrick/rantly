module RantsHelper

  def favorite_link (rant)

   unless favorited(rant)
     link_to "Favorite", favorite_path(rant.user, rant)
   else
      link_to "Unfavorite", unfavorite_path(rant.user, rant)
    end


  end

  private

  def favorited(rant)
    @favorite = Favorite.find_by(user_id: current_user.id, rant_id: rant.id)
  end

end