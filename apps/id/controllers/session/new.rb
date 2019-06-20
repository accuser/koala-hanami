module Id
  module Controllers
    module Session
      class New
        include Id::Action

        before {
          anonymous!
          valid!
        }

        params do
          optional(:credentials).schema(CredentialsValidation)
        end

        expose :credentials

        def call(params)
          @credentials = params.get(:credentials)
        end
      end
    end
  end
end
