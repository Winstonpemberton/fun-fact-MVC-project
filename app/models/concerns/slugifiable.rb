module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      slug_name = slug
      self.all.detect do |object|
        object.slug == slug_name
      end
    end
  end

end
