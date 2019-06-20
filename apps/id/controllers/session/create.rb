module Id
  module Controllers
    module Session
      class Create
        include Id::Action

        before {
          anonymous!
          valid!
        }

        params do
          required(:credentials).schema(CredentialsValidation)
        end

        expose :credentials

        def call(params)
          @credentials = params.get(:credentials)

          result = authenticate_credentials.call(credentials)

          if result.success?
            self.current_user = result.user
            redirect_to Web.routes.root_url
          end
        end
      
        private # impl
        
        attr_reader :authenticate_credentials

        def initialize(deps = {})
          @authenticate_credentials = deps[:authenticate_credentials] || AuthenticateCredentials.new
        end
      end
    end
  end
end
