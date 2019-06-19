RSpec.describe Id::Controllers::Session::New, type: :action do
  let(:action) { described_class.new }
  
  context "#call" do
    let(:credentials) { Hash[email: 'alice@example.com', password: 'secret'] }
    let(:params)      { Hash[credentials: credentials] }

    it "returns HTTP 200 OK" do
      status, headers, body = action.call(params)
      expect(status).to eq 200
    end
  end
end