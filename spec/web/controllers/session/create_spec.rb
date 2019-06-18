RSpec.describe Web::Controllers::Session::Create, type: :action do
  let(:interactor)  { double("AuthenticateCredentials") }
  let(:action)      { described_class.new(authenticate_credentials: interactor) }
  let(:credentials) { {email: 'alice@example.com', password: 'secret'} }
  let(:params)      { {credentials: credentials} }

  context "#call" do
    context "when anonymous" do
      before {
        allow(action).to receive(:anonymous?) { true }
        allow(interactor).to receive(:call).with(credentials) { result }
      }

      context "with valid parameters" do
        let(:result) { double('Result', success?: true, user: double('User', token: 'TOKEN')) }

        it "redirect the client to '/'" do
          status, headers, body = action.call(params)
          expect(status).to eq 302
          expect(headers['Location']).to eq 'http://0.0.0.0:2300/profile'
        end

        it "sets the authentication token" do
          status, headers, body = action.call(params)
          expect(action.session['auth']).to eq 'TOKEN'
        end  
      end

      context "with invalid parameters" do
        let(:result) { double('Result', success?: false) }
     
        it "returns HTTP 200 OK" do
          status, headers, body = action.call(credentials: {email: 'alice@example.com', password: 'secret'})
          expect(status).to eq 200
        end
      end
    end

    context "when authenticated" do
      before {
        allow(action).to receive(:anonymous?) { false }
      }

      it "fails with HTTP 403 Forbidden" do
        status, headers, body = action.call(credentials: {email: 'alice@example.com', password: 'secret'})
        expect(status).to eq 403
      end
    end
  end
end