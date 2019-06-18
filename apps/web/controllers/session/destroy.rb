module Web
  module Controllers
    module Session
      class Destroy
        include Web::Action

        before {
          redirect_to routes.root_url unless authenticated?
        }

        def call(params)
          self.current_user = nil
        end
      end
    end
  end
end
