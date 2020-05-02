class User < ActiveRecord::Base
  has_many :categories
  has_many :facts, through: :categories
end
