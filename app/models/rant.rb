class Rant < ActiveRecord::Base

  belongs_to :user


  validates :rant, presence: true, length:  { minimum: 140}
  validates :rant_title, presence: true, length: { maximum: 50 }


end
