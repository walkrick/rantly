class Rant < ActiveRecord::Base

  belongs_to :user


  validates :rant, presence: true
  validates :rant_title, presence: true


end
