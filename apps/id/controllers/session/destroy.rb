module Id
  module Controllers
    module Session
      class Destroy
        include Id::Action

        def call(params)
          self.current_user = nil
        end
      end
    end
  end
end
