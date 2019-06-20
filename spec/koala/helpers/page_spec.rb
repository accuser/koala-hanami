RSpec.describe Koala::Helpers::Page, type: :helper do
  let(:layout)   { Web::Views::ApplicationLayout.new({ format: :html }, 'contents') }
  let(:rendered) { layout.render }

  it_behaves_like "a view helper"

  context "#page_title" do
    before {
      allow(layout).to receive(:site_title) { 'Example' }
    }

    it "returns the page's title" do
      expect(layout.page_title).to eq 'Example'
    end
  end
end
