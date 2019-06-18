RSpec.describe Web::Views::Session::New, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/session/new.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  context "#form_title" do
    it "returns the form's title" do
      expect(view.form_title).to eq 'Sign in to Koala'
    end
  end

  context "#page_title" do
    it "returns the page's title" do
      expect(view.page_title).to eq 'Sign in to Koala'
    end
  end
end