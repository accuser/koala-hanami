RSpec.describe AuthenticateToken, type: :interactor do
  let(:repository) { double('UserRepository') }
  let(:interactor) { described_class.new(user_repository: repository) }
  let(:token)      { SecureRandom.uuid }
  let(:alice)      { double('User') }
  
  context "#call" do
    context "with valid parameters" do      
      before {
        expect(repository).to receive(:user_with_token).with(token) { alice }
      }

      it "succeeds" do
        result = interactor.call(token: token)
        expect(result.success?).to be true
      end

      it "exposes :user" do
        result = interactor.call(token: token)
        expect(result).to respond_to :user
      end

      it "sets :user" do
        result = interactor.call(token: token)
        expect(result.user).to eq alice
      end
    end

    context "with incorrect :token" do
      before {
        expect(repository).to receive(:user_with_token).with(token) { nil }
      }

      it "fails" do
        result = interactor.call(token: token)
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call(token: token)
        expect(result.errors).to include token: ['not found']
      end
    end

    context "with missing :token parameter" do
      it "fails" do
        result = interactor.call({})
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call({})
        expect(result.errors).to include token: ['is missing']
      end
    end
  end
end 
