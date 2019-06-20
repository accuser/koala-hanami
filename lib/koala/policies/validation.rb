module Koala
  module Policies
    module Validation
      def bad_request!
        halt 400
      end

      def valid!
        bad_request! unless valid?
      end
      
      def valid?
        params.valid?
      end
    end
  end
end
