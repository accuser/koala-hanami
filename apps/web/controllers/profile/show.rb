module Web
  module Controllers
    module Profile
      class Show
        include Web::Action

        attr_reader :user_repository

        def initialize(deps = {})
          @user_repository = deps[:user_repository] || UserRepository.new
        end

        before {
          forbidden! unless authenticated?
        }

        expose :profile

        def call(params)
          if current_user.profile.nil?
            self.current_user = user_repository.find_with_profile(current_user.id)
          end

          if current_user.nil?
            halt 500
          else
            @profile = current_user.profile
          end
        end
      end
    end
  end
end
