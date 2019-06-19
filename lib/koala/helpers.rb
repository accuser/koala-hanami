module Koala
  module Helpers
    def self.included(view)
      view.class_eval do
        include Koala::Helpers::Application
        include Koala::Helpers::Session
      end
    end
  end
end
