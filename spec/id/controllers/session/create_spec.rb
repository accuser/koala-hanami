RSpec.describe Id::Controllers::Session::Create, type: :action do
  let(:interactor)  { double("AuthenticateCredentials") }
  let(:action)      { described_class.new(authenticate_credentials: interactor) }

  context "#call" do
    let(:credentials) { Hash[email: 'alice@example.com', password: 'secret'] }
    let(:params)      { Hash[credentials: credentials] }

    before {
      allow(interactor).to receive(:call).with(credentials) { result }
    }

    context "with correct credentials" do
      let(:result) { double('Result', success?: true, user: double('User', token: 'TOKEN')) }

      it "redirect the client to '/'" do
        status, headers, body = action.call(params)
        expect(status).to eq 302
        expect(headers['Location']).to eq 'http://0.0.0.0:2300/'
      end

      it "sets the authentication token" do
        status, headers, body = action.call(params)
        expect(action.session['auth']).to eq 'TOKEN'
      end  
    end

    context "with incorrect credentials" do
      let(:result) { double('Result', success?: false) }
    
      it "returns HTTP 200 OK" do
        status, headers, body = action.call(params)
        expect(status).to eq 200
      end
    end
  end
end