class User < ActiveRecord::Base
  has_secure_password

  has_many :favorites
  has_many :rants
  has_attached_file :image

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: 'FollowingRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationships


  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :frequency, presence: true
  validates_attachment :image, presence: true,
  :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]}




def following? user
  followed_user_ids.include? user
end

private
def full_name
  [:first_name, :last_name].join(' ')
end
end