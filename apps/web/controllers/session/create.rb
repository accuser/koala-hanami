module Web
  module Controllers
    module Session
      class Create
        include Web::Action

        attr_reader :authenticate_credentials

        def initialize(deps = {})
          @authenticate_credentials = deps[:authenticate_credentials] || AuthenticateCredentials.new
        end

        before {
          forbidden! unless anonymous?
        }

        params do
          required(:credentials).schema(Credentials)
        end

        expose :credentials

        def call(params)
          @credentials = params.get(:credentials)

          result = authenticate_credentials.call(credentials)

          if result.success?
            self.current_user = result.user
            redirect_to routes.profile_url
          end
        end
      end
    end
  end
end
