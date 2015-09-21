class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
