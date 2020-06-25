class Comment < ActiveRecord::Base
  # comments belong to a fact
  belongs_to :fact
  # comments belong to a user
  belongs_to :user
end
