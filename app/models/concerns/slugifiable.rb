module Slugifiable
  module InstanceMethods
    # gets the title of facts and makes them useable for routes
    def slug
      self.title.downcase.gsub(" ", "-")
    end
  end
end
