RSpec.describe Koala::Helpers::Application, type: :helper do
  let(:layout)   { Web::Views::ApplicationLayout.new({ format: :html }, 'contents') }
  let(:rendered) { layout.render }

  it_behaves_like "a view helper"

  context "#company_name" do
    it "returns the company's name" do
      expect(layout.company_name).to eq 'Southwest Koala'
    end
  end

  context "#company_url" do
    it "returns the company's webite URL" do
      expect(layout.company_url).to eq 'https://southwestkoala.co.uk/'
    end
  end

  context "#copyright" do
    before {
      allow(layout).to receive(:copyright_year) { 2019 }
      allow(layout).to receive(:link_to_company) { 'Example' }
    }

    it "returns a formatted copyright notice" do
      expect(layout.copyright).to eq "Copyright &copy; 2019 Example. All rights reserved."
    end
  end

  context "#copyright_year" do
    it "returns the current year" do
      expect(layout.copyright_year).to eq DateTime.now.year
    end
  end

  context "#link_to_company" do
    before {
      allow(layout).to receive(:company_name) { 'Example' }
      allow(layout).to receive(:company_url) { 'http://example.com/'}
    }

    it "returns a formatted link to the company's URL" do
      expect(layout.link_to_company.to_s).to eq '<a href="http://example.com/">Example</a>'
    end

    it "accepts options" do
      expect(layout.link_to_company(class: 'btn').to_s).to eq '<a class="btn" href="http://example.com/">Example</a>'
    end
  end

  context "#link_to_site" do
    before {
      allow(layout).to receive(:site_name) { 'Example' }
      allow(layout).to receive(:site_path) { '/'}
    }

    it "returns a formatted link to the site's root URL" do
      expect(layout.link_to_site.to_s).to eq '<a href="/">Example</a>'
    end

    it "accepts options" do
      expect(layout.link_to_site(class: 'btn').to_s).to eq '<a class="btn" href="/">Example</a>'
    end
  end

  context "#page_title" do
    before {
      allow(layout).to receive(:site_title) { 'Example' }
    }

    it "returns the page's title" do
      expect(layout.page_title).to eq 'Example'
    end
  end

  context "#site_name" do
    it "returns the site's name" do
      expect(layout.site_name).to eq 'Koala'
    end
  end

  context "#site_path" do
    it "returns the site's root path" do
      expect(layout.site_path).to eq '/'
    end
  end

  context "#site_title" do
    before {
      allow(layout).to receive(:site_name) { 'Example' }
    }

    it "returns the site's title" do
      expect(layout.site_title).to eq 'Example'
    end
  end

  context "#site_url" do
    it "returns the site's root URL" do
      expect(layout.site_url).to eq 'http://0.0.0.0:2300/'
    end
  end
end
