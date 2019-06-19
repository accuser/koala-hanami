module Id
  module Controllers
    module Session
      class New
        include Id::Action

        before {
          self.current_user = nil
        }

        params do
          optional(:credentials).schema(CredentialsValidation)
        end

        expose :credentials

        def call(params)
          @credentials = params.get(:credentials)
        end
 
        def valid?(params)
          result = CredentialsValidation.new(params).validate
          result.success?
        end
      end
    end
  end
end
