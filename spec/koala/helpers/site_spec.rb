RSpec.describe Koala::Helpers::Site, type: :helper do
  let(:layout)   { Web::Views::ApplicationLayout.new({ format: :html }, 'contents') }
  let(:rendered) { layout.render }

  it_behaves_like "a view helper"

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
