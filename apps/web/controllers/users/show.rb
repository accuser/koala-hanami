module Web
  module Controllers
    module Users
      class Show
        include Web::Action

        attr_reader :user_repository

        def initialize(deps = {})
          @user_repository = deps[:user_repository] || UserRepository.new
        end

        before {
          unauthorized! unless authenticated?
        }

        params do
          required(:id).filled(:int?)
        end

        expose :user

        def call(params)
          id = params.get(:id)

          user = user_repository.find_with_profile(id)

          if user.nil?
            halt 404
          else
            @user = user
          end
        end

        def valid?(params)
          params.valid?
        end
      end
    end
  end
end
