class Fact < ActiveRecord::Base
  # makes the slug method useable for facts
  include Slugifiable::InstanceMethods
  # facts belong to a category
  belongs_to :category
  # facts belong to a user
  belongs_to :user
  # facts have many comments
  has_many :comments
end
