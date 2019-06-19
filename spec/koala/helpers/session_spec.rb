RSpec.describe Koala::Helpers::Session, type: :helper do
  let(:layout)   { Web::Views::ApplicationLayout.new({ format: :html }, 'contents') }
  let(:rendered) { layout.render }

  context "#link_to_sign_in" do
    it "returns a formatted link for signing in" do
      expect(layout.link_to_sign_in.to_s).to eq '<a href="/session/new">Sign in</a>'
    end

    it "accepts options" do
      expect(layout.link_to_sign_in(class: 'btn').to_s).to eq '<a class="btn" href="/session/new">Sign in</a>'
    end
  end

  context "#link_to_sign_out" do
    it "returns a formatted form for signing up" do
      expect(layout.link_to_sign_out.to_s).to eq '<a href="/session">Sign out</a>'
    end

    it "accepts options" do
      expect(layout.link_to_sign_out(class: 'btn').to_s).to eq '<a class="btn" href="/session">Sign out</a>'
    end
  end
end
