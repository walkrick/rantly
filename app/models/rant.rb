class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites, dependent: :destroy


  validates :rant, presence: true, length:  { minimum: 140}
  validates :rant_title, presence: true, length: { maximum: 50 }

  def favorited_count
    favorites.length
  end

end
