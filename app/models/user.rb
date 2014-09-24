class User < ActiveRecord::Base
  has_secure_password



  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true
  validates :first_name, presence: true, uniqueness: {case_sensitive: false}
  validates :last_name, presence: true, uniqueness: {case_sensitive: false}
  validates :bio, presence: true, uniqueness: {case_sensitive: false}
  validates :frequency, presence: true


end
