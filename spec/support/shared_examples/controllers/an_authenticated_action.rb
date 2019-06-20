shared_examples_for "an authenticated action" do
  context "when anonymous" do
    before {
      allow(action).to receive(:current_user) { nil }
    }

    it "#call fails with HTTP 401 Unauthorized" do
      status, headers, body = action.call(Hash[])
      expect(status).to eq 401
    end
  end
end
