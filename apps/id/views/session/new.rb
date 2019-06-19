module Id
  module Views
    module Session
      class New
        include Id::View

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
