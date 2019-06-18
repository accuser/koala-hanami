RSpec.describe Web::Controllers::Profile::Show, type: :action do
  let(:repository)  { double("UserRepository") }
  let(:action)      { described_class.new(user_repository: repository) }
  let(:credentials) { {email: 'alice@example.com', password: 'secret'} }
  let(:params)      { {credentials: credentials} }

  context "#call" do
    context "when anonymous" do
      before {
        allow(action).to receive(:anonymous?) { true }
      }

      it "fails with HTTP 403 Forbidden" do
        status, headers, body = action.call(credentials: {email: 'alice@example.com', password: 'secret'})
        expect(status).to eq 403
      end
    end
  end
end