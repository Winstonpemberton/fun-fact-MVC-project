class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  # users have a secured password
  has_secure_password
  # users have many facts
  has_many :facts
  # users have many comments
  has_many :comments
end
