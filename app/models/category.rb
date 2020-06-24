class Category < ActiveRecord::Base
  # categories have many facts
  has_many :facts
end
