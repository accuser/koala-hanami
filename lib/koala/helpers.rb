module Koala
  module Helpers
    def self.included(view)
      view.class_eval do
        include Koala::Helpers::Application
        include Koala::Helpers::Page
        include Koala::Helpers::Session
        include Koala::Helpers::Site
      end
    end
  end
end
