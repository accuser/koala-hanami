module Koala
  module Helpers
    module Site
      def link_to_site(options = {})
        link_to site_name, site_path, options
      end

      def site_name
        "Koala"
      end

      def site_path
        Web.routes.root_path
      end

      def site_url
        Web.routes.root_url
      end

      def site_title
        site_name
      end
    end
  end
end
