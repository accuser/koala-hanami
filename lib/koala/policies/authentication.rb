module Koala
  module Policies
    module Authentication
      def self.included(action)
        action.class_eval do
          expose :anonymous?
          expose :authenticated?
          expose :current_user
        end
      end

      # +true+ if the current user is anonymous
      def anonymous?
        current_user.nil?
      end

      # +true+ if the current user is authenticated
      def authenticated?
        !anonymous?
      end

      # Get the current user
      def current_user
        @current_user ||= AuthenticateToken.new.call(token: token).user unless token.nil?
      end

      # Set the current user
      def current_user=(user)
        self.token, @current_user = [user&.token, user]
        current_user
      end

      def forbidden!
        halt 403
      end

      def unauthorized!
        halt 401
      end
    end
  end
end
