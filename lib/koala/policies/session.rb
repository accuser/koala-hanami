module Koala
  module Policies
    module Session
      TOKEN = 'auth'.freeze
      
      # @api private
      # Get the authentication token from the session cookie store
      def token
        session[TOKEN]
      end

      # @api private
      # Set the authentication token
      def token=(token)
        session[TOKEN], @current_user = [token, nil]
      end
    end
  end
end
