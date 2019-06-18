module Web
  module Controllers
    module Session
      class New
        include Web::Action

        before {
          forbidden! unless anonymous?
        }

        params do
          optional(:credentials).schema(Credentials)
        end

        expose :credentials

        def call(params)
          @credentials = params.get(:credentials)
        end
      end
    end
  end
end
