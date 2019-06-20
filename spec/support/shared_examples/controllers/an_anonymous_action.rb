shared_examples_for "an anonymous action" do
  context "when authenticated" do
    before {
      allow(action).to receive(:current_user) { double('User') }
    }

    it "#call fails with HTTP 403 Forbidden" do
      status, headers, body = action.call(Hash[])
      expect(status).to eq 403
    end
  end
end
