RSpec.describe Web::Controllers::Users::Show, type: :action do
  let(:repository) { double('UserRepository' ) }
  let(:action)     { described_class.new(user_repository: repository) }
  let(:params)     { Hash[id: 1] }

  context "when anonymous" do
    before {
      allow(action).to receive(:current_user) { nil }
    }

    it "fails with HTTP 401 Unauthorized" do
      status, headers, body = action.call(params)
      expect(status).to eq 401
    end
  end

  context "when authenticated" do
    before {
      allow(action).to receive(:current_user) { double('authenticated user') }
    }

    context "#call" do
      context "with valid :id parameter" do
        let(:user) { double('User') }

        before {
          allow(repository).to receive(:find_with_profile) { user }
        }

        it "succeeds" do
          status, headers, body = action.call(params)
          expect(status).to eq 200
        end

        it "exposes :user" do
          action.call(params)
          expect(action.exposures).to include :user
        end
      
        it "sets :user" do
          action.call(params)
          expect(action.exposures[:user]).to eq user
        end
      end

      context "with invalid :id parameter" do
        before {
          allow(repository).to receive(:find_with_profile) { nil }
        }

        it "fails with HTTP 404 Not Found" do
          status, headers, body = action.call(params)
          expect(status).to eq 404
        end
      end
    end
  end
end
