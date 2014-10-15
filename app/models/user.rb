class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  has_attached_file :image

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :frequency, presence: true
  validates_attachment :image, presence: true, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]}


end


private


def full_name
  [:first_name, :last_name].join(' ')
end
