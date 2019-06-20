module Web
  module Controllers
    module Users
      class Show
        include Web::Action

        before {
          authenticated!
          valid!
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
      
        private # impl
        
        attr_reader :user_repository

        def initialize(deps = {})
          @user_repository = deps[:user_repository] || UserRepository.new
        end
      end
    end
  end
end
