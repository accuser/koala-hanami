module Koala
  module Policies
    def self.included(action)
      action.class_eval do
        include Koala::Policies::Session
        include Koala::Policies::Authentication
      end
    end
  end
end
