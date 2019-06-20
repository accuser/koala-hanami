module Koala
  module Helpers
    module Application
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
    end
  end
end
