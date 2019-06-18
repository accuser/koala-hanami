module Web
  module Views
    class ApplicationLayout
      include Web::Layout
      
      def company_name
        "Southwest Koala"
      end

      def company_url
        "https://southwestkoala.co.uk/"
      end

      def copyright
        raw "Copyright &copy; #{copyright_year} #{link_to_company}. All rights reserved."
      end

      def copyright_year
        DateTime.now.year
      end

      def link_to_company(options = {})
        link_to company_name, company_url, options
      end

      def link_to_sign_in(options = {})
        link_to "Sign in", routes.new_session_path, options
      end

      def link_to_sign_out(options = {})
        link_to "Sign out", routes.session_path, options
      end

      def link_to_site(options = {})
        link_to site_name, site_path, options
      end

      def page_title
        site_title
      end

      def site_name
        "Koala"
      end

      def site_path
        routes.root_path
      end

      def site_url
        routes.root_url
      end

      def site_title
        site_name
      end
    end
  end
end
