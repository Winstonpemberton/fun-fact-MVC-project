class User < ActiveRecord::Base
  # users have a secured password
  has_secure_password
  # users have many facts
  has_many :facts
end
