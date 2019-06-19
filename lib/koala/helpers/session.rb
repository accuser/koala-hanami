module Koala
  module Helpers
    module Session
      def link_to_sign_in(options = {})
        link_to "Sign in", Id.routes.new_session_path, options
      end

      def link_to_sign_out(options = {})
        link_to "Sign out", Id.routes.session_path, options
      end
    end
  end
end
