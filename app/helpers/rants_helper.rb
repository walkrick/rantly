module RantsHelper

  def favorite_link (rant)
    link_to "Favorite", rant_favorites_path(rant), :method => :post
  end






end