module Web
  module Views
    module Session
      class Create
        include Web::View

        def form_title
          "Sign in to #{site_title}"
        end

        def page_title
          form_title
        end
      end
    end
  end
end
