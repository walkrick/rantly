class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :frequency, presence: true


end


private


def full_name
  [:first_name, :last_name].join(' ')
end
