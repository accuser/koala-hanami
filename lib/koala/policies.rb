module Koala
  module Policies
    def self.included(action)
      action.class_eval do
        include Koala::Policies::Authentication
        include Koala::Policies::Session
        include Koala::Policies::Validation
      end
    end
  end
end
