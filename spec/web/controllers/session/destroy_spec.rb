RSpec.describe Web::Controllers::Session::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  context "#call" do
    context "when anonymous" do
      before {
        allow(action).to receive(:anonymous?) { true }
      }

      it "redirects the client to root" do
        status, headers, body = action.call(params)
        expect(status).to eq 302
        expect(headers['Location']).to eq 'http://0.0.0.0:2300/'
      end
    end

    context "when authenticated" do
      before {
        allow(action).to receive(:anonymous?) { false }
      }

      it "succeeds" do
        status, headers, body = action.call(params)
        expect(status).to eq 200
      end

      it "resets the authentication token" do
        status, headers, body = action.call(params)
        expect(action.session['auth']).to be nil
      end
    end
  end
end