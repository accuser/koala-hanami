module Web
  module Views
    module Profile
      class Show
        include Web::View

        def full_name
          [profile.first_name, profile.last_name].compact.join(' ')
        end
      end
    end
  end
end
