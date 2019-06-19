RSpec.describe Id::Controllers::Session::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  context "#call" do
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